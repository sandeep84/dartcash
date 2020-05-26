Pure dart implementation of GNUCash sqlite format file support.

Offers read-only access to the contents of a file in the GNUCash sqlite format. The following operations are supported:
* List of accounts including current balances in both the account commodity and base currency.
* List details of splits and transactions belonging to an account

API example:
```
    GncBook gncBook = new GncBook();
    await gncBook.open("Accounts.gnucash");

    for (final account in gncBook.accounts()) {
      print("${account.name}: ${account.quantity} -> ${account.get_balance()}");
    }
```
