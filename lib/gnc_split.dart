import 'gnc_database.dart';
import 'gnc_book.dart';
import 'gnc_account.dart';

class GncSplit 
{
  final GncBook _book;
  GncAccount _parent;
  final Split _split;

  GncSplit(this._book, this._split);

  String get guid => _split.guid;
  String get tx_guid => _split.tx_guid;
  String get account_guid => _split.account_guid;

  double get quantity => _split.quantity_num / _split.quantity_denom;
}

