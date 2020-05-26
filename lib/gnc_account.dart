import 'package:intl/intl.dart';

import 'gnc_database.dart';
import 'gnc_book.dart';
import 'gnc_split.dart';
import 'gnc_commodity.dart';
import 'dart:collection'; 

class GncAccount 
{
  final GncBook _book;
  final Account _account;
  final GncCommodity commodity;
  GncAccount _parent;
  SplayTreeSet<GncAccount> children = SplayTreeSet((GncAccount a, GncAccount b) => a.name.compareTo(b.name));
  List<GncSplit> splits = [];
  double quantity = 0.0;

  GncAccount(this._book, this._account, this.commodity);

  String get guid => _account.guid;
  String get parent_guid => _account.parent_guid;
  String get name => _account.name;
  String get account_type => _account.account_type;
  String get commodity_guid => _account.commodity_guid;

  GncCommodity get baseCurrency => _book.baseCurrency;

  void addChild(GncAccount child) 
  {
    child._parent = this;
    this.children.add(child);
  }

  void addSplit(GncSplit split)
  {
    splits.add(split);
    quantity += split.quantity;
  }

  double get_quantity() {
    return quantity;
  }

  String getQuantityAsString() {
    String symbol = NumberFormat.currency().simpleCurrencySymbol(this.commodity.mnemonic);
    final currencyFormat = new NumberFormat.currency(symbol:symbol);
    return currencyFormat.format(quantity);
  }

  String getBalanceAsString([recurse=true, other_commodity=null, natural_sign=true]) {
    if (other_commodity == null) other_commodity = _book.baseCurrency;
    String symbol = NumberFormat.currency().simpleCurrencySymbol(other_commodity.mnemonic);
    final currencyFormat = new NumberFormat.currency(symbol:symbol);
    return currencyFormat.format(get_balance(recurse, other_commodity, natural_sign));
  }

  double get_balance([recurse=true, other_commodity=null, natural_sign=true]) {
    if (other_commodity == null) other_commodity = _book.baseCurrency;

    double balance = get_quantity();

    if (this.commodity != other_commodity) {
      double factor = null;
      double factor1 = null;
      double factor2 = null;

      if ((factor = this.commodity.conversion_factor(other_commodity)) != null) {
        // Try converting this commodity into the other using the price list
        balance *= factor;
      }
      else if ((factor = other_commodity.conversion_factor(this.commodity)) != null) {
        // Try converting the other commodity into this one using the price list
        balance /= factor;
      }
      else if (((factor1 = this.commodity.conversion_factor(_parent.commodity)) != null) &&
               ((factor2 = _parent.commodity.conversion_factor(other_commodity)) != null)) {
        // try converting through the parent commodity
        balance *= factor1 * factor2;
      }
      else if (((factor1 = this.commodity.conversion_factor(_book.baseCurrency)) != null) &&
               ((factor2 = _book.baseCurrency.conversion_factor(other_commodity)) != null)) {
        // Try converting through the base commodity
        balance *= factor1 * factor2;
      }
    }

    if (recurse) {
      children.forEach( (child) => balance += child.get_balance(recurse, other_commodity, natural_sign) );
    }

    return balance;
  }

}

