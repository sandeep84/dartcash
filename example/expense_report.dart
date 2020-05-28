import 'package:dartcash/gnc_book.dart';
import 'package:dartcash/gnc_utils.dart';

void main() async {
  var gncBook = GncBook();
  await gncBook.open('HomeAccounts.gnucash');

  var summary = accountSummaryByType(
      accountType: 'EXPENSE',
      startDate: '2020-04-01',
      endDate: '2020-05-01',
      reportCommodity: gncBook.baseCurrency,
      rootAccount: gncBook.rootAccount);
  summary.forEach((account, sum) =>
      print('${account}: ${gncBook.baseCurrency.format(sum)}'));

  gncBook.close();
}
