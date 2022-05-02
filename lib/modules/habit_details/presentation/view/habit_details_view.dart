import 'package:flutter/material.dart';
import '/modules/dashboard/presentation/widget/progress_widget.dart';
import '/modules/habit_details/presentation/widget/clipper.dart';

class HabitDetailsView extends StatelessWidget {
  const HabitDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              ?.apply(fontSizeFactor: 1.12, color: Colors.grey),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 13.0, horizontal: 3),
                child: CustomPaint(
                  child: Builder(builder: (context) {
                    return Container();
                  }),
                  painter: CustomerProgressWidget(
                    color: Colors.red,
                    fill: 5,
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
                              ?.apply(fontSizeFactor: 1.15, color: Colors.grey),
                        ),
                        Text(
                          '75%',
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
                        color: Colors.purple,
                        value: 0.4,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Repeat',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.apply(fontSizeFactor: 1.1, color: Colors.grey),
                      ),
                      Text(
                        '75%',
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
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.apply(fontSizeFactor: 1.1, color: Colors.grey),
                      ),
                      Text(
                        '8 Days',
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
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.apply(fontSizeFactor: 1.1, color: Colors.grey),
                      ),
                      Text(
                        '11 Days',
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
                            color: Colors.redAccent,
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
                            color: Colors.redAccent,
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
    );
  }
}
