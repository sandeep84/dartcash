import 'gnc_database.dart';

class GncSplit {
  final Split _split;
  final Transaction _transaction;

  GncSplit(this._split, this._transaction);

  String get guid => _split.guid;
  String get tx_guid => _split.tx_guid;
  String get account_guid => _split.account_guid;

  double get quantity => _split.quantity_num / _split.quantity_denom;

  String get description => _transaction.description;
  DateTime get date => _transaction.post_date;
}
