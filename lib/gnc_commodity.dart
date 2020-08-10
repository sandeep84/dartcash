import 'package:dartcash/gnc_book.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart';
import 'package:uuid/uuid.dart';
import 'dart:convert';
import 'gnc_database.dart';

class GncPrice {
  final Price _price;

  GncPrice(this._price);

  String get guid => _price.guid;
  String get commodity_guid => _price.commodity_guid;
  String get currency_guid => _price.currency_guid;
  double get value => _price.value_num / _price.value_denom;
}

class GncCommodity {
  final Commodity _commodity;
  final GncBook _book;
  final _uuid = Uuid();
  NumberFormat currencyFormat;
  List<GncPrice> priceList = [];

  GncCommodity(this._book, this._commodity) {
    final symbol =
        NumberFormat.currency().simpleCurrencySymbol(_commodity.mnemonic);
    currencyFormat = NumberFormat.currency(symbol: symbol);
  }

  String get guid => _commodity.guid;
  String get namespace => _commodity.namespace;
  String get mnemonic => _commodity.mnemonic;
  String get quote_source => _commodity.quote_source;

  String format(double value) {
    return currencyFormat.format(value);
  }

  void addPrice(GncPrice p) {
    priceList.add(p);
  }

  double conversion_factor(GncCommodity other) {
    for (final p in priceList) {
      if (p.currency_guid == other.guid) {
        return p.value;
      }
    }

    return null;
  }

  void updatePrice() async {
    if (quote_source == 'yahoo_json') {
      var url = 'https://query1.finance.yahoo.com/v7/finance/quote?symbols=' +
          mnemonic;
      var response = await get(url);
      var rawJson = response.body;
      final map = jsonDecode(rawJson) as Map<String, dynamic>;

      Price p;
      p.guid = _uuid.v4();
      p.commodity_guid = guid;
      p.currency_guid = _book.getCommodityByMnemonic(map['currency']).guid;
      p.date =
          DateTime.fromMillisecondsSinceEpoch(map['regularMarketTime'] * 1000);
      ;
      p.value_num = map['regularMarketPrice'] * 1000;
      p.value_denom = 1000;

      addPrice(GncPrice(p));
    }
  }
}
