import 'gnc_database.dart';
import 'gnc_book.dart';
import 'gnc_split.dart';
import 'dart:collection'; 

class GncAccount 
{
  final GncBook _book;
  final Account _account;
  GncAccount _parent;
  SplayTreeSet<GncAccount> children = SplayTreeSet((GncAccount a, GncAccount b) => a.name.compareTo(b.name));
  List<GncSplit> splits = [];

  GncAccount(this._book, this._account);

  String get guid => _account.guid;
  String get parent_guid => _account.parent_guid;
  String get name => _account.name;
  String get account_type => _account.account_type;
  String get commodity_guid => _account.commodity_guid;

  void addChild(GncAccount child) 
  {
    child._parent = this;
    this.children.add(child);
  }

  void addSplit(GncSplit split)
  {
    splits.add(split);
  }

  double get_balance([recursive=true]) {
    double balance = 0.0;
    splits.forEach( (split) => balance += split.quantity );

    if (recursive) {
      children.forEach( (child) => balance += child.get_balance(recursive) );
    }

    return balance;
  }

}

