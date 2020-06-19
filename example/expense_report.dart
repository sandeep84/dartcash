import 'package:dartcash/gnc_book.dart';
import 'package:dartcash/gnc_utils.dart';

void main() async {
  var gncBook = GncBook();
  await gncBook.sqliteOpen('HomeAccounts.gnucash');

  var summary = accountSummaryByType(
      accountType: 'EXPENSE',
      startDate: DateTime(2020, 4, 1),
      endDate: DateTime(2020, 5, 1),
      reportCommodity: gncBook.baseCurrency,
      rootAccount: gncBook.rootAccount);
  summary.forEach((account, sum) =>
      print('${account}: ${gncBook.baseCurrency.format(sum)}'));

  gncBook.close();
}
