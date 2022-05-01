import 'package:flutter/material.dart';
import 'package:habit_tracker/modules/dashboard/presentation/widget/progress_widget.dart';
import 'package:habit_tracker/modules/habit_details/presentation/view/habit_details_view.dart';

class HabitListTitle extends StatelessWidget {
  const HabitListTitle({Key? key, this.color = Colors.red, this.fill = 0})
      : super(key: key);
  final Color color;
  final int fill;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: CircleAvatar(
                backgroundColor: color,
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Habit Title',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.apply(fontSizeFactor: 1.1),
                  ),
                  Text(
                    '5 from 7 this week',
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
          padding: const EdgeInsets.symmetric(vertical: 13.0, horizontal: 18),
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
          height: 13,
        )
      ],
    );
  }
}
