import 'package:flutter/material.dart';
import 'package:habit_tracker/modules/dashboard/presentation/widget/habit_list_tile_controller.dart';
import 'package:habit_tracker/modules/dashboard/presentation/widget/progress_widget.dart';
import 'package:habit_tracker/repository/local_storage.dart';
import 'package:provider/provider.dart';

class HabitListTitle extends StatelessWidget {
  const HabitListTitle({
    Key? key,
    this.color = Colors.red,
    required this.selectedDate,
    required this.habit,
  }) : super(key: key);

  final Color color;
  final DateTime selectedDate;
  final HabitData habit;
  // final GlobalKey _paintKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HabitListTitleController(
        context: context,
        habit: habit,
        selectedDate: selectedDate,
      ),
      child: Consumer<HabitListTitleController>(
        builder: (BuildContext context, HabitListTitleController controller,
            Widget? child) {
          int fill = (((controller.countOfCompleteInWeek * 100) /
                      controller.habit.days) *
                  0.1)
              .toInt();
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      child: CircleAvatar(
                        backgroundColor: controller.todayCompleted
                            ? color
                            : Colors.grey.shade300,
                        child: Icon(
                          Icons.check,
                          color: controller.todayCompleted
                              ? Colors.white
                              : Colors.black54,
                        ),
                      ),
                      onTap: controller.ontap,
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.habit.name,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.apply(fontSizeFactor: 1.1),
                        ),
                        Text(
                          '${controller.countOfCompleteInWeek} from ${controller.habit.days} this week',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.apply(fontSizeFactor: 1.1),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 13.0, horizontal: 18),
                child: CustomPaint(
                  child: Container(),
                  foregroundPainter: CustomerProgressWidget(
                    color: color,
                    fill: fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 13,
              )
            ],
          );
        },
      ),
    );
  }
}
