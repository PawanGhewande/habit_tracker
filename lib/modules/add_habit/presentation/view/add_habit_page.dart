import 'package:flutter/material.dart';
import '/modules/add_habit/presentation/logic/add_habit_controller.dart';
import 'package:provider/provider.dart';
import 'package:weekday_selector/weekday_selector.dart';

class AddHabitPage extends StatelessWidget {
  const AddHabitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AddHabitController(),
      child: Consumer<AddHabitController>(
        builder: (BuildContext context, AddHabitController controller,
                Widget? child) =>
            Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text(
                          'New Habit',
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              ?.apply(fontWeightDelta: 1),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: TextField(
                      // controller: textController,
                      decoration: InputDecoration(
                        hintText: 'Habit',
                        fillColor: Colors.green.withOpacity(0.07),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 2.0,
                          horizontal: 10.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Colors.red,
                    child: WeekdaySelector(
                      // selectedTextStyle: TextStyle(color: Colors.white),
                      elevation: 0,
                      // shortWeekdays: const ['S', 'M', 'T', 'W', 'T', 'F', 'S'],
                      color: Colors.grey,
                      focusColor: Colors.redAccent.shade100,
                      selectedColor: Colors.deepPurple,
                      selectedElevation: 0,
                      onChanged: controller.onChange,
                      values: controller.values,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
