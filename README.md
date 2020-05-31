Pure dart implementation of GNUCash sqlite format file support.

Offers read-only access to the contents of a file in the GNUCash sqlite format. The following operations are supported:
* List of accounts including current balances in both the account commodity and base currency.
* List details of splits and transactions belonging to an account.
* Account summary functions for income/expense reports.

Acknowledgements:
* [GnuCash project](https://gnucash.org)
* [Piecash](https://github.com/sdementen/piecash) - some parts of the book parsing are based on the piecash code.
