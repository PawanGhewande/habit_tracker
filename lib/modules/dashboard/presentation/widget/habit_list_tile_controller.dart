import 'package:flutter/cupertino.dart';
import 'package:habit_tracker/repository/local_storage.dart';
import 'package:habit_tracker/utility/day_calc.dart';
import 'package:provider/provider.dart';

class HabitListTitleController extends ChangeNotifier {
  ///object to maintain status
  bool todayCompleted = false;
  late final LocalStorage _storage;
  final BuildContext context;
  final HabitData habit;
  int countOfCompleteInWeek = 0;
  final DateTime selectedDate;

  ///Constructor
  HabitListTitleController(
      {required this.context,
      required this.habit,
      required this.selectedDate}) {
    _storage = Provider.of<LocalStorage>(context, listen: false);

    ///init
    Future.delayed(Duration.zero, () async {
      HabitDetail? habitDetail =
          await _storage.isTodayCompleted(habit.id, selectedDate);
      todayCompleted = (habitDetail != null);
      countOfCompleteInWeek = (await _storage.countOfHabitInWeek(
              habit.id,
              DateUtils.weekStart(selectedDate),
              DateUtils.weekEnd(selectedDate)))
          .length;
      notifyListeners();
    });
  }

  ontap() async {
    todayCompleted = !todayCompleted;
    if (todayCompleted) {
      await _storage.insertHabitDetails(habit.id, selectedDate);
    } else {
      await _storage.deleteHabitDetails(habit.id, selectedDate);
    }
    notifyListeners();
  }
}
