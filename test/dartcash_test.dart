import 'package:test/test.dart';
import 'package:intl/intl.dart';

import 'package:dartcash/gnc_book.dart';
import 'package:dartcash/gnc_account.dart';

void printAccount(GncAccount account, String prefix, NumberFormat baseFormat) async
{
  final quantity = account.commodity.format(account.get_quantity());
  final balance  = baseFormat.format(account.get_balance());
  print('${prefix}${account.name}: ${quantity} -> ${balance}');
  account.children.forEach( (child) async {
    await printAccount(child, prefix + '    ', baseFormat);
  });
}

void main() {
  test('gnc_book', () async {
    var gncBook = GncBook();
    await gncBook.open('HomeAccounts.gnucash');
    await printAccount(gncBook.rootAccount, '', gncBook.baseCurrency.currencyFormat);
  });
}
