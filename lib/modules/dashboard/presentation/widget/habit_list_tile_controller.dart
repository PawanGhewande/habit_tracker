import 'package:flutter/cupertino.dart';
import 'package:habit_tracker/repository/local_storage.dart';
import 'package:provider/provider.dart';

class HabitListTitleController extends ChangeNotifier {
  ///object to maintain status
  bool todayCompleted = false;
  late final LocalStorage _storage;
  final BuildContext context;
  final HabitData habit;
  HabitListTitleController({required this.context, required this.habit}) {
    _storage = Provider.of<LocalStorage>(context, listen: false);
  }

  ontap() {
    todayCompleted = !todayCompleted;
    if (todayCompleted) {
      _storage.insertHabitDetails(habit.id);
    } else {
      _storage.deleteHabitDetails(habit.id);
    }

    notifyListeners();
  }
}
