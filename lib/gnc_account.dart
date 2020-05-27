import 'gnc_database.dart';
import 'gnc_book.dart';
import 'gnc_split.dart';
import 'gnc_commodity.dart';
import 'dart:collection';

class GncAccount {
  final GncBook _book;
  final Account _account;
  final GncCommodity commodity;
  GncAccount _parent;
  SplayTreeSet<GncAccount> children =
      SplayTreeSet((GncAccount a, GncAccount b) => a.name.compareTo(b.name));
  List<GncSplit> splits = [];
  double quantity = 0.0;

  static final List<String> root_types = ['ROOT'];
  static final List<String> asset_types = ['RECEIVABLE', 'MUTUAL', 'CASH', 'ASSET', 'BANK', 'STOCK'];
  static final List<String> liability_types = ['CREDIT', 'LIABILITY', 'PAYABLE'];
  static final List<String> income_types = ['INCOME'];
  static final List<String> expense_types = ['EXPENSE'];
  static final List<String> trading_types = ['TRADING'];
  static final List<String> equity_types = ['EQUITY'];

  // types that are compatible with other types
  static List<String> incexp_types;
  static List<String> assetliab_types;

  // types according to the sign of their balance
  static List<String> positive_types;
  static List<String> negative_types;

  GncAccount(this._book, this._account, this.commodity) {
    incexp_types = income_types + expense_types;
    assetliab_types = asset_types + liability_types;
    positive_types = asset_types + expense_types + trading_types;
    negative_types = liability_types + income_types + equity_types;
  }

  String get guid => _account.guid;
  String get parent_guid => _account.parent_guid;
  String get name => _account.name;
  String get account_type => _account.account_type;
  String get commodity_guid => _account.commodity_guid;

  GncCommodity get baseCurrency => _book.baseCurrency;

  double get sign => (negative_types.contains(account_type) ? -1.0 : 1.0);

  void addChild(GncAccount child) {
    child._parent = this;
    children.add(child);
  }

  void addSplit(GncSplit split) {
    splits.add(split);
    quantity += split.quantity;
  }

  double get_quantity([natural_sign = true]) {
    return ((natural_sign && (quantity.abs() > 0)) ? quantity * sign : quantity);
  }

  double get_balance([recurse = true, other_commodity, natural_sign = true]) {
    other_commodity ??= _book.baseCurrency;

    var balance = quantity;

    if (commodity != other_commodity) {
      double factor, factor1, factor2;

      if ((factor = commodity.conversion_factor(other_commodity)) != null) {
        // Try converting this commodity into the other using the price list
        balance *= factor;
      } else if ((factor = other_commodity.conversion_factor(commodity)) !=
          null) {
        // Try converting the other commodity into this one using the price list
        balance /= factor;
      } else if (((factor1 = commodity.conversion_factor(_parent.commodity)) !=
              null) &&
          ((factor2 = _parent.commodity.conversion_factor(other_commodity)) !=
              null)) {
        // try converting through the parent commodity
        balance *= factor1 * factor2;
      } else if (((factor1 = commodity.conversion_factor(_book.baseCurrency)) !=
              null) &&
          ((factor2 = _book.baseCurrency.conversion_factor(other_commodity)) !=
              null)) {
        // Try converting through the base commodity
        balance *= factor1 * factor2;
      }
    }

    if (recurse) {
      children.forEach((child) =>
          balance += child.get_balance(recurse, other_commodity, false));
    }

    if (natural_sign && (balance.abs() > 0) ) balance *= sign;

    return balance;
  }
}
