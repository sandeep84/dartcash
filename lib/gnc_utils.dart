import 'package:dartcash/gnc_account.dart';
import 'package:dartcash/gnc_commodity.dart';
import 'dart:collection';

void splitSummary(
    String accountType,
    String startDate,
    String endDate,
    int maxLevel,
    GncCommodity reportCommodity,
    int level,
    GncAccount rootAccount,
    GncAccount account,
    Map<GncAccount, double> accMap) {
  for (final acc in account.children) {
    if (acc.account_type != accountType) continue;

    if (level < maxLevel) {
      // Add a new entry to the map with the account sum
      accMap[acc] = acc.sumSplits(startDate, endDate, reportCommodity);
      // Recurse on all the children of this account
      splitSummary(accountType, startDate, endDate, maxLevel, reportCommodity,
          level + 1, acc, acc, accMap);
    } else {
      // Update the rootAccount entry in the map with the current account sum
      accMap[rootAccount] += acc.sumSplits(startDate, endDate);
      // Recurse on all the children of this account
      splitSummary(accountType, startDate, endDate, maxLevel, reportCommodity,
          level + 1, rootAccount, acc, accMap);
    }
  }
}

LinkedHashMap<String, double> accountSummaryByType(
    {String accountType,
    String startDate,
    String endDate,
    int maxLevel = 2,
    int numDetailedAccounts = 7,
    GncCommodity reportCommodity,
    GncAccount rootAccount}) {
  Map<GncAccount, double> summary = {};
  splitSummary(accountType, startDate, endDate, maxLevel, reportCommodity, 0,
      rootAccount, rootAccount, summary);
  var sortedKeys = summary.keys.toList(growable: false)
    ..sort((k1, k2) => summary[k2].compareTo(summary[k1]));

  var result = LinkedHashMap<String, double>();
  var i;
  for (i = 0; i < numDetailedAccounts - 1; i++) {
    if (i < sortedKeys.length) {
      final account = sortedKeys[i];
      if (summary[account] > 0) result[account.name] = summary[account];
    }
  }
  if (i < sortedKeys.length) {
    var others = 0.0;
    for (; i < sortedKeys.length; i++) {
      others += summary[sortedKeys[i]];
    }
    if (others > 0) result['Others'] = others;
  }

  return result;
}
