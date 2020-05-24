import 'gnc_database.dart';
import 'dart:collection'; 

class GncAccount 
{
  GncAccount(this._database, this._account);

  final GncDatabase _database;
  final Account _account;
  SplayTreeSet<GncAccount> children = SplayTreeSet((GncAccount a, GncAccount b) => a.name.compareTo(b.name));

  String get guid => _account.guid;
  String get parent_guid => _account.parent_guid;
  String get name => _account.name;
  String get account_type => _account.account_type;
  String get commodity_guid => _account.commodity_guid;

  void addChild(GncAccount child) 
  {
    this.children.add(child);
  }

  double get_balance([bool recursive=true])
  {
    double balance = 0.0;

    //final accountSplitListStmt = _database.prepare('''
    //        Select
    //          Sum(splits.value_num) / 100.0 as balance
    //        From
    //          accounts Left Outer Join
    //          splits On accounts.guid = splits.account_guid
    //        Where
    //          accounts.guid = "${guid}"
    //        ''');

    //for (final GncAccount in accountSplitListStmt.select()) {
    //   if (GncAccount["balance"] != null) balance = GncAccount["balance"];
    //}

    //if (recursive) {
    //  this.children.forEach((c) => balance += c.get_balance(recursive));
    //}

    return balance;
  }
}

