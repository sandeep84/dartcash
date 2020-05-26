import 'package:test/test.dart';
import 'package:intl/intl.dart';

import 'package:dartcash/gnc_book.dart';
import 'package:dartcash/gnc_account.dart';

void printAccount(GncAccount account, String prefix, NumberFormat baseFormat) async
{
  String quantity = "${account.quantity} ${account.commodity.mnemonic}";

  if (account.commodity.namespace == "CURRENCY") {
    String symbol = NumberFormat.currency().simpleCurrencySymbol(account.commodity.mnemonic);
    final currencyFormat = new NumberFormat.currency(symbol:symbol);
    quantity = currencyFormat.format(account.quantity);
  }

  print("${prefix}${account.name}: ${quantity} -> ${baseFormat.format(account.get_balance())}");
  account.children.forEach( (child) async {
    await printAccount(child, prefix + "    ", baseFormat);
  });
}

void main() {
  test('gnc_book', () async {
    GncBook gncBook = new GncBook();
    await gncBook.open("HomeAccounts.gnucash");

    String baseSymbol = NumberFormat.currency().simpleCurrencySymbol(gncBook.baseCurrency.mnemonic);
    final currencyFormat = new NumberFormat.currency(symbol:baseSymbol);
    await printAccount(gncBook.rootAccount, "", currencyFormat);
  });
}
