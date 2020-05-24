import 'package:test/test.dart';

import 'package:dartcash/gnc_book.dart';
import 'package:dartcash/gnc_account.dart';

void main() {
  test('gnc_book', () async {
    GncBook gncBook = new GncBook();
    await gncBook.open("HomeAccounts.gnucash");

    List<GncAccount> accList = await gncBook.accounts();
    accList.forEach( (account) {
      print("${account.name}: ${account.get_balance()}");
    });
  });
}
