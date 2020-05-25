import 'gnc_database.dart';
import 'gnc_account.dart';
import 'gnc_split.dart';

class GncBook {
    GncDatabase _database;
    final Map<String, GncAccount> accountMap = {}; // map with key=guid
    GncAccount rootAccount;

    void open(String dbPath) async {
        _database = new GncDatabase(dbPath);

        // Create the tree of accounts and identify the root account
        for (final account in await _database.get_accounts()) {
          GncAccount newAcc = GncAccount(this, account);
          accountMap[newAcc.guid] = newAcc;

          if ((newAcc.account_type == "ROOT") && (newAcc.name == "Root Account")) {
            rootAccount = newAcc;
          }
        }

        accountMap.forEach((guid, account) {
          if (account.parent_guid != null) {
            accountMap[ account.parent_guid ].addChild(account);
          }
        });

        for (final split in await _database.get_splits()) {
          accountMap[split.account_guid].addSplit(GncSplit(this, split));
        }

    }

    Future<List<GncAccount>> accounts() async {
        return rootAccount.children.toList();
    }

    GncAccount getAccountByGuid(String guid) => accountMap[guid];
}

