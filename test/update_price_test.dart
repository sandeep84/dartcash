import 'dart:io';
import 'package:path/path.dart' as p;

import 'package:dartcash/gnc_book.dart';

void main() async {
  var gncBook = GncBook();
  await gncBook
      .sqliteOpen(p.join(Directory.current.path, 'HomeAccounts.gnucash'));

  await gncBook.updatePriceDatabase();
  gncBook.close();
}
