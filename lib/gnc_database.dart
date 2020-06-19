import 'package:database/sql.dart';
import 'package:database_adapter_postgre/database_adapter_postgre.dart';

class NotImplemented implements Exception {
  String cause;
  NotImplemented(this.cause);
}

class Commodity {
  String guid;
  String namespace;
  String mnemonic;
  String fullname;
  int fraction;

  Commodity(Map _commodity) {
    guid = _commodity['guid'];
    namespace = _commodity['namespace'];
    mnemonic = _commodity['mnemonic'];
    fullname = _commodity['fullname'];
    fraction = _commodity['fraction'];
  }
}

class Price {
  String guid;
  String commodity_guid;
  String currency_guid;
  DateTime date;
  int value_num;
  int value_denom;

  Price(Map _price) {
    guid = _price['guid'];
    commodity_guid = _price['commodity_guid'];
    currency_guid = _price['currency_guid'];
    date = _price['date'];
    value_num = _price['value_num'];
    value_denom = _price['value_denom'];
  }
}

class Account {
  String guid;
  String parent_guid;
  String name;
  String account_type;
  String commodity_guid;
  int commodity_scu;
  int non_std_scu;

  Account(Map _account) {
    guid = _account['guid'];
    parent_guid = _account['parent_guid'];
    name = _account['name'];
    account_type = _account['account_type'];
    commodity_guid = _account['commodity_guid'];
    commodity_scu = _account['commodity_scu'];
    non_std_scu = _account['non_std_scu'];
  }
}

class Transaction {
  String guid;
  String currency_guid;
  String num;
  DateTime post_date;
  DateTime enter_date;
  String description;

  Transaction(Map _transaction) {
    guid = _transaction['guid'];
    currency_guid = _transaction['currency_guid'];
    num = _transaction['num'];
    post_date = _transaction['post_date'];
    enter_date = _transaction['enter_date'];
    description = _transaction['description'];
  }
}

class Split {
  String guid;
  String tx_guid;
  String account_guid;
  String memo;
  String action;
  int value_num;
  int value_denom;
  int quantity_num;
  int quantity_denom;

  Transaction transaction;

  Split(Map _split) {
    guid = _split['guid'];
    tx_guid = _split['tx_guid'];
    account_guid = _split['account_guid'];
    memo = _split['memo'];
    action = _split['action'];
    value_num = _split['value_num'];
    value_denom = _split['value_denom'];
    quantity_num = _split['quantity_num'];
    quantity_denom = _split['quantity_denom'];

    transaction = Transaction(_split);
  }
}

class GncDatabase {
  Postgre config;
  SqlClient client;

  GncDatabase.sqlite(String dbPath) {
    throw NotImplemented('SQLite support not implemented yet.');
  }

  GncDatabase.postgre(
      {String host,
      int port,
      String user,
      String password,
      String databaseName}) {
    config = Postgre(
      host: host,
      port: port,
      user: user,
      password: password,
      databaseName: databaseName,
    );

    client = config.database().sqlClient;
  }

  void close() {
    client = null;
    config.close();
    config = null;
  }

  Future<List<Account>> get_accounts() async {
    List<Account> accounts;
    accounts = [];
    for (final _acc in await client.query('SELECT * from accounts').toMaps()) {
      accounts.add(Account(_acc));
    }

    return accounts;
  }

  Future<List<Split>> get_splits() async {
    List<Split> splits;
    splits = [];
    for (final _split in await client.query('''
      SELECT * from transactions
      LEFT OUTER JOIN splits ON transactions.guid = splits.tx_guid
      ORDER BY transactions.post_date DESC;
    ''').toMaps()) {
      splits.add(Split(_split));
    }

    return splits;
  }

  Future<List<Commodity>> get_commodities() async {
    List<Commodity> commodities;
    commodities = [];
    for (final _commodity
        in await client.query('SELECT * from commodities').toMaps()) {
      commodities.add(Commodity(_commodity));
    }

    return commodities;
  }

  Future<List<Price>> get_prices() async {
    List<Price> prices;
    prices = [];
    for (final _price in await client.query('''
      SELECT * from prices
      ORDER BY prices.date DESC;
    ''').toMaps()) {
      prices.add(Price(_price));
    }

    return prices;
  }
}
