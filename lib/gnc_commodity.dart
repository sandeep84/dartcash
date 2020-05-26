import 'package:intl/intl.dart';

import 'gnc_database.dart';

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
  final Commodity _commodity;
  NumberFormat currencyFormat;
  List<GncPrice> priceList = [];

  GncCommodity(this._commodity) {
    final symbol = NumberFormat.currency().simpleCurrencySymbol(_commodity.mnemonic);
    currencyFormat = NumberFormat.currency(symbol:symbol);
  }

  String get guid => _commodity.guid;
  String get namespace => _commodity.namespace;
  String get mnemonic => _commodity.mnemonic;

  String format(double value) {
    return currencyFormat.format(value);
  }

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

