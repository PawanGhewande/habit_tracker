// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_storage.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class HabitData extends DataClass implements Insertable<HabitData> {
  final int id;
  final String name;
  final DateTime date;
  final int days;
  final bool visible;
  HabitData(
      {required this.id,
      required this.name,
      required this.date,
      required this.days,
      required this.visible});
  factory HabitData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return HabitData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date'])!,
      days: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}days'])!,
      visible: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}visible'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['date'] = Variable<DateTime>(date);
    map['days'] = Variable<int>(days);
    map['visible'] = Variable<bool>(visible);
    return map;
  }

  HabitCompanion toCompanion(bool nullToAbsent) {
    return HabitCompanion(
      id: Value(id),
      name: Value(name),
      date: Value(date),
      days: Value(days),
      visible: Value(visible),
    );
  }

  factory HabitData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HabitData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      date: serializer.fromJson<DateTime>(json['date']),
      days: serializer.fromJson<int>(json['days']),
      visible: serializer.fromJson<bool>(json['visible']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'date': serializer.toJson<DateTime>(date),
      'days': serializer.toJson<int>(days),
      'visible': serializer.toJson<bool>(visible),
    };
  }

  HabitData copyWith(
          {int? id, String? name, DateTime? date, int? days, bool? visible}) =>
      HabitData(
        id: id ?? this.id,
        name: name ?? this.name,
        date: date ?? this.date,
        days: days ?? this.days,
        visible: visible ?? this.visible,
      );
  @override
  String toString() {
    return (StringBuffer('HabitData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('date: $date, ')
          ..write('days: $days, ')
          ..write('visible: $visible')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, date, days, visible);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HabitData &&
          other.id == this.id &&
          other.name == this.name &&
          other.date == this.date &&
          other.days == this.days &&
          other.visible == this.visible);
}

class HabitCompanion extends UpdateCompanion<HabitData> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> date;
  final Value<int> days;
  final Value<bool> visible;
  const HabitCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.date = const Value.absent(),
    this.days = const Value.absent(),
    this.visible = const Value.absent(),
  });
  HabitCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required DateTime date,
    required int days,
    this.visible = const Value.absent(),
  })  : name = Value(name),
        date = Value(date),
        days = Value(days);
  static Insertable<HabitData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? date,
    Expression<int>? days,
    Expression<bool>? visible,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (date != null) 'date': date,
      if (days != null) 'days': days,
      if (visible != null) 'visible': visible,
    });
  }

  HabitCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<DateTime>? date,
      Value<int>? days,
      Value<bool>? visible}) {
    return HabitCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      date: date ?? this.date,
      days: days ?? this.days,
      visible: visible ?? this.visible,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (days.present) {
      map['days'] = Variable<int>(days.value);
    }
    if (visible.present) {
      map['visible'] = Variable<bool>(visible.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabitCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('date: $date, ')
          ..write('days: $days, ')
          ..write('visible: $visible')
          ..write(')'))
        .toString();
  }
}

class $HabitTable extends Habit with TableInfo<$HabitTable, HabitData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HabitTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 70),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime?> date = GeneratedColumn<DateTime?>(
      'date', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _daysMeta = const VerificationMeta('days');
  @override
  late final GeneratedColumn<int?> days = GeneratedColumn<int?>(
      'days', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _visibleMeta = const VerificationMeta('visible');
  @override
  late final GeneratedColumn<bool?> visible = GeneratedColumn<bool?>(
      'visible', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (visible IN (0, 1))',
      defaultValue: const Constant<bool>(true));
  @override
  List<GeneratedColumn> get $columns => [id, name, date, days, visible];
  @override
  String get aliasedName => _alias ?? 'habit';
  @override
  String get actualTableName => 'habit';
  @override
  VerificationContext validateIntegrity(Insertable<HabitData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('days')) {
      context.handle(
          _daysMeta, days.isAcceptableOrUnknown(data['days']!, _daysMeta));
    } else if (isInserting) {
      context.missing(_daysMeta);
    }
    if (data.containsKey('visible')) {
      context.handle(_visibleMeta,
          visible.isAcceptableOrUnknown(data['visible']!, _visibleMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HabitData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return HabitData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $HabitTable createAlias(String alias) {
    return $HabitTable(attachedDatabase, alias);
  }
}

class HabitDetail extends DataClass implements Insertable<HabitDetail> {
  final int id;
  final int habitId;
  final DateTime? date;
  final bool visible;
  HabitDetail(
      {required this.id,
      required this.habitId,
      this.date,
      required this.visible});
  factory HabitDetail.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return HabitDetail(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      habitId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}habit_id'])!,
      date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date']),
      visible: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}visible'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['habit_id'] = Variable<int>(habitId);
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime?>(date);
    }
    map['visible'] = Variable<bool>(visible);
    return map;
  }

  HabitDetailsCompanion toCompanion(bool nullToAbsent) {
    return HabitDetailsCompanion(
      id: Value(id),
      habitId: Value(habitId),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      visible: Value(visible),
    );
  }

  factory HabitDetail.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HabitDetail(
      id: serializer.fromJson<int>(json['id']),
      habitId: serializer.fromJson<int>(json['habitId']),
      date: serializer.fromJson<DateTime?>(json['date']),
      visible: serializer.fromJson<bool>(json['visible']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'habitId': serializer.toJson<int>(habitId),
      'date': serializer.toJson<DateTime?>(date),
      'visible': serializer.toJson<bool>(visible),
    };
  }

  HabitDetail copyWith(
          {int? id, int? habitId, DateTime? date, bool? visible}) =>
      HabitDetail(
        id: id ?? this.id,
        habitId: habitId ?? this.habitId,
        date: date ?? this.date,
        visible: visible ?? this.visible,
      );
  @override
  String toString() {
    return (StringBuffer('HabitDetail(')
          ..write('id: $id, ')
          ..write('habitId: $habitId, ')
          ..write('date: $date, ')
          ..write('visible: $visible')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, habitId, date, visible);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HabitDetail &&
          other.id == this.id &&
          other.habitId == this.habitId &&
          other.date == this.date &&
          other.visible == this.visible);
}

class HabitDetailsCompanion extends UpdateCompanion<HabitDetail> {
  final Value<int> id;
  final Value<int> habitId;
  final Value<DateTime?> date;
  final Value<bool> visible;
  const HabitDetailsCompanion({
    this.id = const Value.absent(),
    this.habitId = const Value.absent(),
    this.date = const Value.absent(),
    this.visible = const Value.absent(),
  });
  HabitDetailsCompanion.insert({
    this.id = const Value.absent(),
    required int habitId,
    this.date = const Value.absent(),
    this.visible = const Value.absent(),
  }) : habitId = Value(habitId);
  static Insertable<HabitDetail> custom({
    Expression<int>? id,
    Expression<int>? habitId,
    Expression<DateTime?>? date,
    Expression<bool>? visible,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (habitId != null) 'habit_id': habitId,
      if (date != null) 'date': date,
      if (visible != null) 'visible': visible,
    });
  }

  HabitDetailsCompanion copyWith(
      {Value<int>? id,
      Value<int>? habitId,
      Value<DateTime?>? date,
      Value<bool>? visible}) {
    return HabitDetailsCompanion(
      id: id ?? this.id,
      habitId: habitId ?? this.habitId,
      date: date ?? this.date,
      visible: visible ?? this.visible,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (habitId.present) {
      map['habit_id'] = Variable<int>(habitId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime?>(date.value);
    }
    if (visible.present) {
      map['visible'] = Variable<bool>(visible.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabitDetailsCompanion(')
          ..write('id: $id, ')
          ..write('habitId: $habitId, ')
          ..write('date: $date, ')
          ..write('visible: $visible')
          ..write(')'))
        .toString();
  }
}

class $HabitDetailsTable extends HabitDetails
    with TableInfo<$HabitDetailsTable, HabitDetail> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HabitDetailsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _habitIdMeta = const VerificationMeta('habitId');
  @override
  late final GeneratedColumn<int?> habitId = GeneratedColumn<int?>(
      'habit_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime?> date = GeneratedColumn<DateTime?>(
      'date', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _visibleMeta = const VerificationMeta('visible');
  @override
  late final GeneratedColumn<bool?> visible = GeneratedColumn<bool?>(
      'visible', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (visible IN (0, 1))',
      defaultValue: const Constant<bool>(true));
  @override
  List<GeneratedColumn> get $columns => [id, habitId, date, visible];
  @override
  String get aliasedName => _alias ?? 'habit_details';
  @override
  String get actualTableName => 'habit_details';
  @override
  VerificationContext validateIntegrity(Insertable<HabitDetail> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('habit_id')) {
      context.handle(_habitIdMeta,
          habitId.isAcceptableOrUnknown(data['habit_id']!, _habitIdMeta));
    } else if (isInserting) {
      context.missing(_habitIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    if (data.containsKey('visible')) {
      context.handle(_visibleMeta,
          visible.isAcceptableOrUnknown(data['visible']!, _visibleMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HabitDetail map(Map<String, dynamic> data, {String? tablePrefix}) {
    return HabitDetail.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $HabitDetailsTable createAlias(String alias) {
    return $HabitDetailsTable(attachedDatabase, alias);
  }
}

abstract class _$LocalStorage extends GeneratedDatabase {
  _$LocalStorage(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $HabitTable habit = $HabitTable(this);
  late final $HabitDetailsTable habitDetails = $HabitDetailsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [habit, habitDetails];
}
