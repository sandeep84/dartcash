import 'dart:io';
import 'package:path/path.dart' as p;

import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:dartcash/gnc_book.dart';
import 'package:dartcash/gnc_account.dart';

void printAccount(GncAccount account, String prefix, NumberFormat baseFormat) {
  final quantity = account.commodity.format(account.getQuantity());
  final balance = baseFormat.format(account.getBalance());
  print('${prefix}${account.name}: ${quantity} -> ${balance}');
  account.children.forEach((child) {
    printAccount(child, prefix + '    ', baseFormat);
  });
}

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  var gncBook = GncBook();
  await gncBook
      .sqliteOpen(p.join(Directory.current.path, 'HomeAccounts.gnucash'));
  for (final account in gncBook.accounts()) {
    printAccount(account, '', gncBook.baseCurrency.currencyFormat);
  }
  gncBook.close();
}
