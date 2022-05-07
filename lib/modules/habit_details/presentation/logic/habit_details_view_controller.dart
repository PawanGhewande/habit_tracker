import 'package:flutter/material.dart';
import 'package:habit_tracker/repository/local_storage.dart';
import 'package:provider/provider.dart';

class HabitDetaislViewController extends ChangeNotifier {
  BuildContext context;
  late final LocalStorage _storage;
  final HabitData habit;
  int totalFollweedDays = 0;

  ///constructor
  HabitDetaislViewController({required this.context, required this.habit}) {
    _storage = Provider.of<LocalStorage>(context);

    Future.delayed(Duration.zero, () async {
      totalFollweedDays =
          (await _storage.totalCompletedDayCount(habit.id)).length;
      notifyListeners();
    });
  }
}
