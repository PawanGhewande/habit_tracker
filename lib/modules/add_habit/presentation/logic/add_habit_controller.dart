import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:day_picker/model/day_in_week.dart';
import 'package:habit_tracker/repository/local_storage.dart';
import 'package:habit_tracker/modules/add_habit/presentation/widget/sucess_dialog.dart';

class AddHabitController extends ChangeNotifier {
  ///local storage
  late final LocalStorage _storage;

  ///ddays
  final List<DayInWeek> days = [
    DayInWeek("Sun"),
    DayInWeek("Mon"),
    DayInWeek("Tue"),
    DayInWeek("Wed"),
    DayInWeek("Thu"), 
    DayInWeek("Fri"),
    DayInWeek("Sat"),
  ];

  List<String> selectedDays = [];

  ///habit controllers
  TextEditingController habitController = TextEditingController();

  ///object of build context shared through UI
  BuildContext context;

  ///constructor UI
  AddHabitController(this.context) {
    _storage = Provider.of<LocalStorage>(context, listen: false);
  }

  onChange(values) {
    selectedDays = values;
  }

  Future<void> onSave() async {
    if (habitController.text.isNotEmpty && selectedDays.isNotEmpty) {
      await _storage.insertHabit(
        HabitData(
          name: habitController.text,
          date: DateTime.now(),
          days: selectedDays.length,
          visible: true,
          id: 0,
        ),
      );
      successDialog(context);
    }
  }
}
