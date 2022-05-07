import 'package:flutter/material.dart';
import 'package:habit_tracker/modules/habit_details/presentation/logic/habit_details_view_controller.dart';
import 'package:habit_tracker/repository/local_storage.dart';
import 'package:provider/provider.dart';
import '/modules/dashboard/presentation/widget/progress_widget.dart';
import '/modules/habit_details/presentation/widget/clipper.dart';

class HabitDetailsView extends StatelessWidget {
  const HabitDetailsView({
    Key? key,
    required this.habit,
    required this.description,
    required this.color,
    required this.fill,
    required this.strength,
    required this.streakThisWeek,
  }) : super(key: key);

  final HabitData habit;
  final String description;
  final Color color;
  final int fill;
  final double strength;
  final int streakThisWeek;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HabitDetaislViewController(context: context, habit: habit),
      child: Consumer<HabitDetaislViewController>(
        builder: (BuildContext context, HabitDetaislViewController controller,
                Widget? child) =>
            Scaffold(
          backgroundColor: Colors.grey.shade100,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              habit.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.apply(fontSizeFactor: 1.1),
                            ),
                            Text(
                              description,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.apply(
                                      fontSizeFactor: 1.12, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              width: 1,
                              color: Colors.grey.shade400,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8), // border width
                            child: Icon(
                              Icons.edit,
                              color: Colors.grey.shade400,
                              size: 24,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 13.0, horizontal: 3),
                    child: CustomPaint(
                      child: Builder(builder: (context) {
                        return Container();
                      }),
                      painter: CustomerProgressWidget(
                        color: color,
                        fill: fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Strength',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.apply(
                                      fontSizeFactor: 1.15, color: Colors.grey),
                            ),
                            Text(
                              '$strength%',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.apply(fontSizeFactor: 1.1),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.topCenter,
                          margin: const EdgeInsets.only(top: 20),
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.grey.shade300,
                            color: color,
                            value: strength * 0.01,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Repeat',
                            style: Theme.of(context).textTheme.subtitle1?.apply(
                                fontSizeFactor: 1.1, color: Colors.grey),
                          ),
                          Text(
                            '$strength%',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.apply(fontSizeFactor: 1.1),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Streak',
                            style: Theme.of(context).textTheme.subtitle1?.apply(
                                fontSizeFactor: 1.1, color: Colors.grey),
                          ),
                          Text(
                            '$streakThisWeek Days',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.apply(fontSizeFactor: 1.1),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Best',
                            style: Theme.of(context).textTheme.subtitle1?.apply(
                                fontSizeFactor: 1.1, color: Colors.grey),
                          ),
                          Text(
                            '${controller.totalFollweedDays} Days',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.apply(fontSizeFactor: 1.1),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0,
                          child: ClipPath(
                            clipper: MyWaveClipper(),
                            child: Opacity(
                              opacity: 0.5,
                              child: Container(
                                color: color,
                                width: 900,
                                height: 200,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: ClipPath(
                            clipper: MyWaveClipper(),
                            child: Opacity(
                              opacity: 0.5,
                              child: Container(
                                color: color,
                                width: 900,
                                height: 200,
                              ),
                            ),
                          ),
                        ),
                      ],
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
