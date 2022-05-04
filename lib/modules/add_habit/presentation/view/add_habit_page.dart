import 'package:day_picker/day_picker.dart';
import 'package:flutter/material.dart';
import '/modules/add_habit/presentation/logic/add_habit_controller.dart';
import 'package:provider/provider.dart';

class AddHabitPage extends StatelessWidget {
  const AddHabitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AddHabitController(context),
      child: Consumer<AddHabitController>(
        builder: (BuildContext context, AddHabitController controller,
                Widget? child) =>
            Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 2.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          'https://w7.pngwing.com/pngs/167/807/png-transparent-abstract-factory-pattern-pattern-retro-floral-shading-blue-floral-textile.png',
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Text(
                          'Name Your Habit',
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: TextField(
                        controller: controller.habitController,
                        decoration: InputDecoration(
                          hintText: 'Habit',
                          fillColor: const Color(0xff34B3C8).withOpacity(0.09),
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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Text(
                          'Select Days',
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                    ),
                    SelectWeekDays(
                      backgroundColor: Colors.transparent,
                      fontWeight: FontWeight.w500,
                      days: controller.days,
                      border: false,
                      daysFillColor: const Color(0xff34B3C8),
                      selectedDayTextColor: Colors.white,
                      unSelectedDayTextColor: Colors.black54,
                      boxDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.0),
                        color: Colors.transparent,
                      ),
                      onSelect: controller.onChange,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          radius: 20.0,
                          borderRadius: BorderRadius.circular(20.0),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.30,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                              color: Colors.grey.shade200,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Center(
                                child: Text(
                                  'Cancel',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.apply(color: Colors.black54),
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          radius: 20.0,
                          borderRadius: BorderRadius.circular(20.0),
                          onTap: controller.onSave,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.30,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              color: Color(0xff34B3C8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Center(
                                child: Text(
                                  'Add',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.apply(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
