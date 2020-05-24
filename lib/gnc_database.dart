import 'package:moor_ffi/moor_ffi.dart';
import 'package:moor/moor.dart';
import 'dart:io';
import 'dart:collection'; 

// assuming that your file is called account.dart. This will give an error at first,
// but it's needed for moor to know about the generated code
part 'gnc_database.g.dart';

// this will generate a table called "todos" for us. The rows of that table will
// be represented by a class called "Todo".
class Accounts extends Table {
  TextColumn get guid => text().withLength(max:32)();
  TextColumn get parent_guid => text().withLength(max:32)();
  TextColumn get name => text().withLength(max:2048)();
  TextColumn get account_type => text().withLength(max:2048)();
  TextColumn get commodity_guid => text().withLength(max:32)();
  IntColumn get commodity_scu => integer()();
  IntColumn get non_std_scu => integer()();
}

LazyDatabase _openConnection(String dbPath) {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    return VmDatabase(File(dbPath));
  });
}

@UseMoor(tables: [Accounts])
class GncDatabase extends _$GncDatabase {
  // we tell the database where to store the data with this constructor
  GncDatabase(String dbPath) : super(_openConnection(dbPath));

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 1;

  Future<List<Account>> get_accounts() => select(accounts).get();
}

