import 'package:test/test.dart';

import 'package:dartcash/gnc_book.dart';
import 'package:dartcash/gnc_account.dart';

void printAccount(GncAccount account, String prefix)
{
  print("${prefix}${account.name}: ${account.get_balance()}");
  account.children.forEach( (child) {
    printAccount(child, prefix + "    ");
  });
}

void main() {
  test('gnc_book', () async {
    GncBook gncBook = new GncBook();
    await gncBook.open("HomeAccounts.gnucash");
    printAccount(gncBook.rootAccount, "");
  });
}
