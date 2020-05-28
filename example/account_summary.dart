import 'package:intl/intl.dart';
import 'package:dartcash/gnc_book.dart';
import 'package:dartcash/gnc_account.dart';

void printAccount(GncAccount account, String prefix, NumberFormat baseFormat) {
  final quantity = account.commodity.format(account.get_quantity());
  final balance = baseFormat.format(account.get_balance());
  print('${prefix}${account.name}: ${quantity} -> ${balance}');
  account.children.forEach((child) {
    printAccount(child, prefix + '    ', baseFormat);
  });
}

void main() async {
  var gncBook = GncBook();
  await gncBook.open('HomeAccounts.gnucash');
  for (final account in gncBook.accounts()) {
    printAccount(account, '', gncBook.baseCurrency.currencyFormat);
  }
  gncBook.close();
}
