import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'local_storage.g.dart';

class Habit extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 70)();
  DateTimeColumn get date => dateTime()();
  IntColumn get days => integer()();
  BoolColumn get visible => boolean().withDefault(const Constant<bool>(true))();
}

class HabitDetails extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get habitId => integer()();
  DateTimeColumn get date => dateTime().nullable()();
  BoolColumn get visible => boolean().withDefault(const Constant<bool>(true))();
}

@DriftDatabase(tables: <Type>[Habit, HabitDetails])
class LocalStorage extends _$LocalStorage {
  LocalStorage() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  //insert new habit
  Future insertHabit(HabitData data) => into(habit).insert(
        HabitCompanion.insert(
          name: data.name,
          date: data.date,
          days: data.days,
          visible: Value(data.visible),
        ),
      );

  //insert new habit
  Future insertHabitDetails(int id) => into(habitDetails).insert(
        HabitDetailsCompanion.insert(
          habitId: id,
          date: Value(
            DateTime.now(),
          ),
          visible: const Value(true),
        ),
      );

  ///delete todays entry
  Future deleteHabitDetails(int id) {
    // delete the oldest nine tasks
    return (delete(habitDetails)
          ..where((t) => t.id.equals(id))
          ..where((row) {
            final rd = row.date;
            final today = DateTime.now();
            return rd.year.equals(today.year) &
                rd.month.equals(today.month) &
                rd.day.equals(today.day);
          }))
        .go();
  }

  ///todays habit completed
  Future<HabitDetail> isTodayCompleted(int id, DateTime date) async {
    return (select(habitDetails)
          ..where((row) => row.id.equals(id))
          ..where((row) {
            final rd = row.date;
            return rd.year.equals(date.year) &
                rd.month.equals(date.month) &
                rd.day.equals(date.day);
          }))
        .getSingle();
  }

  ///queries for graph
  Future<List<HabitData>> getHabits(DateTime date) async {
    return (select(habit)..where((row) => row.visible.equals(true))
        // ..where((row) {
        //   final rd = row.date;
        //   return rd.year.equals(date.year) &
        //       rd.month.equals(date.month) &
        //       rd.day.equals(date.day);
        // })
        )
        .get();
  }
}

LazyDatabase _openConnection() {
  LazyDatabase lazyDatabase = LazyDatabase(() async {
    final Directory dbFolder = await getApplicationDocumentsDirectory();
    final File file = File(p.join(dbFolder.path, 'HabitDB.db'));
    return NativeDatabase(file);
  });
  return lazyDatabase;
}
