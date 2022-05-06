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
  Future insertHabitDetails(int id, DateTime date) => into(habitDetails).insert(
        HabitDetailsCompanion.insert(
          habitId: id,
          date: Value(minToday(date).add(const Duration(minutes: 1))),
          visible: const Value(true),
        ),
      );

  ///delete todays entry
  Future deleteHabitDetails(int id, DateTime date) {
    // delete the oldest nine tasks
    return (delete(habitDetails)
          ..where((t) => t.habitId.equals(id))
          ..where((row) =>
              row.date.isBetweenValues(minToday(date), maxToday(date))))
        .go();
  }

  ///todays habit completed
  Future<HabitDetail?> isTodayCompleted(int id, DateTime date) async {
    return (select(habitDetails)
          ..where(
              (row) => row.date.isBetweenValues(minToday(date), maxToday(date)))
          ..where((row) => row.habitId.equals(id)))
        .getSingleOrNull();
  }

  ///queries for graph
  Future<List<HabitData>> getHabits() async {
    return (select(habit)..where((row) => row.visible.equals(true)))
        // ..where((row) => row.date.isBetweenValues(minToday, maxToday)))

        .get();
  }

  ///count number of habits
  Future<List<HabitData>> countOfHabit() {
    return (select(habit)..where((row) => row.visible.equals(true)))
        // ..where((row) => row.date.isBetweenValues(minToday, maxToday)))
        .get();
  }

  ///count number of habits
  Future<List<HabitDetail>> countOfHabitInWeek(
      int habitId, DateTime start, DateTime end) async {
    return (select(habitDetails)
          ..where((row) => row.visible.equals(true))
          ..where((row) => row.habitId.equals(habitId))
          ..where((row) => row.date.isBetweenValues(start, end)))
        .get();
  }

  DateTime minToday(DateTime date) => DateTime.parse(
      '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')} 00:00:00');
  DateTime maxToday(DateTime date) => DateTime.parse(
      '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')} 23:59:59');
}

LazyDatabase _openConnection() {
  LazyDatabase lazyDatabase = LazyDatabase(() async {
    final Directory dbFolder = await getApplicationDocumentsDirectory();
    final File file = File(p.join(dbFolder.path, 'HabitDB.db'));
    return NativeDatabase(file);
  });
  return lazyDatabase;
}
