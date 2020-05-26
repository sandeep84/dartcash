import 'package:moor_ffi/moor_ffi.dart';
import 'package:moor/moor.dart';
import 'dart:io';
import 'dart:collection'; 

// assuming that your file is called account.dart. This will give an error at first,
// but it's needed for moor to know about the generated code
part 'gnc_database.g.dart';

@DataClassName("Commodity")
class Commodities extends Table {
  TextColumn get guid => text().withLength(max:32)();
  TextColumn get namespace => text().withLength(max:2048)();
  TextColumn get mnemonic => text().withLength(max:2048)();
  TextColumn get fullname => text().withLength(max:2048)();
  IntColumn get fraction => integer()();

  @override 
  Set<Column> get primaryKey => {guid}; 
}

class Prices extends Table {
  TextColumn get guid => text().withLength(max:32)();
  TextColumn get commodity_guid => text().withLength(max:32)();
  TextColumn get currency_guid => text().withLength(max:32)();
  TextColumn get date => text().withLength(max:19)();
  IntColumn get value_num => integer()();
  IntColumn get value_denom => integer()();

  @override 
  Set<Column> get primaryKey => {guid}; 
}

class Accounts extends Table {
  TextColumn get guid => text().withLength(max:32)();
  TextColumn get parent_guid => text().withLength(max:32)();
  TextColumn get name => text().withLength(max:2048)();
  TextColumn get account_type => text().withLength(max:2048)();
  TextColumn get commodity_guid => text().withLength(max:32)();
  IntColumn get commodity_scu => integer()();
  IntColumn get non_std_scu => integer()();

  @override 
  Set<Column> get primaryKey => {guid}; 
}

class Transactions extends Table {
  TextColumn get guid => text().withLength(max:32)();
  TextColumn get currency_guid => text().withLength(max:32)();
  TextColumn get num => text().withLength(max:2048)();
  TextColumn get post_date => text().withLength(max:19)();
  TextColumn get enter_date => text().withLength(max:19)();
  TextColumn get description => text().withLength(max:2048)();
}

class Splits extends Table {
  TextColumn get guid => text().withLength(max:32)();
  TextColumn get tx_guid => text().withLength(max:32)();
  TextColumn get account_guid => text().withLength(max:32)();
  TextColumn get memo => text().withLength(max:2048)();
  TextColumn get action => text().withLength(max:2048)();
  IntColumn get value_num => integer()();
  IntColumn get value_denom => integer()();
  IntColumn get quantity_num => integer()();
  IntColumn get quantity_denom => integer()();

  @override 
  Set<Column> get primaryKey => {guid}; 
}

LazyDatabase _openConnection(String dbPath) {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    return VmDatabase(File(dbPath));
  });
}

@UseMoor(tables: [Commodities, Prices, Accounts, Splits, Transactions])
class GncDatabase extends _$GncDatabase {
  // we tell the database where to store the data with this constructor
  GncDatabase(String dbPath) : super(_openConnection(dbPath));

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 1;

  Future<List<Account>> get_accounts() => select(accounts).get();
  Future<List<TypedResult>> get_splits() => (select(transactions)
      ..orderBy([(t) => OrderingTerm(expression: t.post_date, mode: OrderingMode.desc)])
      )
      .join([ leftOuterJoin(splits, splits.tx_guid.equalsExp(transactions.guid)), ])
      .get();
  Future<List<Commodity>> get_commodities() => select(commodities).get();
  Future<List<Price>> get_prices() => (select(prices)..orderBy([(t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc)])).get();
}

