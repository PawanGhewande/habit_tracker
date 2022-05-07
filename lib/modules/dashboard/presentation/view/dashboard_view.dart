import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/modules/add_habit/presentation/view/add_habit_page.dart';
import 'package:habit_tracker/modules/dashboard/presentation/logic/dashboard_controller.dart';
import 'package:habit_tracker/modules/dashboard/presentation/widget/habit_list_tile.dart';
import 'package:habit_tracker/modules/habit_details/presentation/view/habit_details_view.dart';
import 'package:habit_tracker/repository/local_storage.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DashboardController(context),
      child: Consumer<DashboardController>(
        builder: (BuildContext context, DashboardController controller,
                Widget? child) =>
            Scaffold(
          backgroundColor: Colors.grey.shade100,
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Most Popular ',
                          style: Theme.of(context).textTheme.headline5?.apply(
                                fontWeightDelta: 1,
                              ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Habits',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        child: const CircleAvatar(
                          backgroundColor: Colors.deepPurple,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const AddHabitPage(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 175,
                  child: FutureBuilder<List<HabitData>>(
                      future: controller.getHabits(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<HabitData>> snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data!.isEmpty) {
                            return const Center(
                              child: Text("No Habit Found."),
                            );
                          }
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data?.length,
                            itemBuilder: (BuildContext context, int index) {
                              return SizedBox(
                                width: 165,
                                child: Card(
                                  elevation: 0,
                                  margin: const EdgeInsets.all(8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      12,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 9.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text(
                                          '${snapshot.data?[index].name.substring(0, 2)}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4
                                              ?.apply(
                                                fontWeightDelta: 1,
                                                color: Colors.black87,
                                              ),
                                        ),
                                        Text(
                                          '${snapshot.data?[index].name}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        } else if (snapshot.hasError) {}
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                ),
                DatePicker(
                  DateTime.now(),
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Colors.black,
                  selectedTextColor: Colors.white,
                  onDateChange: controller.onChange,
                ),
                if (controller.selectedDate == null)
                  const Center(
                    child: Text("Please select Date"),
                  )
                else
                  Expanded(
                    child: FutureBuilder<List<HabitData>>(
                      future: controller.getHabits(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<HabitData>> snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data!.isEmpty) {
                            return const Center(
                              child: Text("Start by adding new habit."),
                            );
                          }
                          return Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Your Habits ',
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ' ${snapshot.data?.length}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              ?.apply(
                                                  color: Colors.grey,
                                                  fontSizeFactor: 1.2),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: snapshot.data?.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return HabitListTitle(
                                      key: GlobalKey(),
                                      color:
                                          controller.randomColor ?? Colors.red,
                                      habit: snapshot.data![index],
                                      selectedDate: controller.selectedDate,
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        } else if (snapshot.hasError) {}
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
