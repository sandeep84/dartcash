import 'gnc_database.dart';
import 'gnc_account.dart';

class GncBook {
    GncDatabase _database;
    GncAccount rootAccount;

    void open(String dbPath) async {
        print("Opening database: " + dbPath);
        _database = new GncDatabase(dbPath);

        print("Querying database");

        // Create the tree of accounts and identify the root account
        final Map<String, GncAccount> accountMap = {}; // map with key=guid
        for (final account in await _database.get_accounts()) {
          print("Processing account ${account.name}...");
          GncAccount newAcc = GncAccount(_database, account);
          accountMap[newAcc.guid] = newAcc;
        }

        print("Creating tree...");
        accountMap.forEach((guid, account) {
          if (account.parent_guid != null) {
            accountMap[ account.parent_guid ].addChild(account);
          }
          else if (account.name == "Root Account") {
            rootAccount = account;
          }
        });
        print("Done creating tree...");

    }

    Future<List<GncAccount>> accounts() async {
        return rootAccount.children.toList();
    }

}

