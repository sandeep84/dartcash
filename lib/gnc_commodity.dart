import 'gnc_database.dart';
import 'gnc_book.dart';
import 'gnc_account.dart';

class GncPrice
{
  final Price _price;

  GncPrice(this._price);

  String get guid => _price.guid;
  String get commodity_guid => _price.commodity_guid;
  String get currency_guid => _price.currency_guid;
  double get value => _price.value_num / _price.value_denom;
}

class GncCommodity 
{
  final GncBook _book;
  final Commodity _commodity;
  List<GncPrice> priceList = [];

  GncCommodity(this._book, this._commodity);

  String get guid => _commodity.guid;
  String get namespace => _commodity.namespace;
  String get mnemonic => _commodity.mnemonic;

  void addPrice(GncPrice p) {
    priceList.add(p);
  }

  double conversion_factor(GncCommodity other) {
    for (final p in priceList) {
      if (p.currency_guid == other.guid) {
        //print("Converting ${mnemonic} to ${other.mnemonic} at price ${p.value}");
        return p.value;
      }
    }

    return null;
  }
}

