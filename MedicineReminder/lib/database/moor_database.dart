import 'package:moor_flutter/moor_flutter.dart';
part 'moor_database.g.dart';

class MedicinesTable extends Table {
  // autoincrement sets this to the primary key
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 5, max: 50)();
  TextColumn get image => text()();
  TextColumn get dose => text()();
}

@UseMoor(tables: [MedicinesTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

  Future<List<MedicinesTableData>> getAllMedicines() =>
      select(medicinesTable).get();
  Future insertMedicine(MedicinesTableData medicine) =>
      into(medicinesTable).insert(medicine);
  Future updateMedicine(MedicinesTableData medicine) =>
      update(medicinesTable).replace(medicine);
  Future deleteMedicine(MedicinesTableData medicine) =>
      delete(medicinesTable).delete(medicine);
}
