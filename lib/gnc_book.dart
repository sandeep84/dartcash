import 'gnc_database.dart';
import 'gnc_account.dart';
import 'gnc_split.dart';
import 'gnc_commodity.dart';

class GncBook {
  GncDatabase session;
  final Map<String, GncAccount> accountMap = {}; // map with key=guid
  final Map<String, GncCommodity> commodityMap = {}; // map with key=guid
  GncAccount rootAccount;

  bool get isOpen => session != null;

  GncCommodity get baseCurrency {
    return rootAccount.commodity;
  }

  Future<void> sqliteOpen(String dbPath) async {
    session = GncDatabase.sqlite(dbPath);
    await initAccounts();
  }

  Future<void> postgreOpen(
      {String host,
      int port,
      String user,
      String password,
      String databaseName}) async {
    session = GncDatabase.postgre(
      host: host,
      port: port,
      user: user,
      password: password,
      databaseName: databaseName,
    );
    await initAccounts();
  }

  Future<void> initAccounts() async {
    for (final commodity in await session.get_commodities()) {
      commodityMap[commodity.guid] = GncCommodity(this, commodity);
    }

    for (final price in await session.get_prices()) {
      commodityMap[price.commodity_guid].addPrice(GncPrice(price));
    }

    // Create the tree of accounts and identify the root account
    for (final account in await session.get_accounts()) {
      var newAcc =
          GncAccount(this, account, commodityMap[account.commodity_guid]);
      accountMap[newAcc.guid] = newAcc;

      if ((newAcc.account_type == 'ROOT') && (newAcc.name == 'Root Account')) {
        rootAccount = newAcc;
      }
    }

    accountMap.forEach((guid, account) {
      if (account.parent_guid != null) {
        accountMap[account.parent_guid].addChild(account);
      }
    });

    for (final split in await session.get_splits()) {
      accountMap[split.account_guid]
          .addSplit(GncSplit(split, split.transaction));
    }
  }

  void close() {
    if (session != null) session.close();
    session = null;
    rootAccount = null;
    accountMap.clear();
    commodityMap.clear();
  }

  List<GncAccount> accounts() {
    return rootAccount.children.toList();
  }

  GncAccount getAccountByGuid(String guid) => accountMap[guid];

  GncCommodity getCommodityByMnemonic(String mnemonic) {
    for (final commodity in commodityMap.values) {
      if (commodity.mnemonic == mnemonic) {
        return commodity;
      }
    }
    return null;
  }

  Future<void> updatePriceDatabase() async {
    for (final commodity in commodityMap.values) {
      await commodity.updatePrice();
    }
  }
}
