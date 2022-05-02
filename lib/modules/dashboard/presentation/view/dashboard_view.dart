import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:habit_tracker/modules/dashboard/presentation/widget/habit_list_tile.dart';
import 'package:habit_tracker/modules/habit_details/presentation/view/habit_details_view.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.grey.shade100,
        statusBarBrightness: Brightness.light,
      ),
    );

    return Scaffold(
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
                  const CircleAvatar(
                    backgroundColor: Colors.deepPurple,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 175,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
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
                        padding: const EdgeInsets.symmetric(horizontal: 9.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              'PG',
                              style:
                                  Theme.of(context).textTheme.headline4?.apply(
                                        fontWeightDelta: 1,
                                        color: Colors.black87,
                                      ),
                            ),
                            Text(
                              'Pawan Ghewande',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            DatePicker(
              DateTime.now(),
              initialSelectedDate: DateTime.now(),
              selectionColor: Colors.black,
              selectedTextColor: Colors.white,
              onDateChange: (date) {
                // New date selected
                // setState(() {
                //   _selectedValue = date;
                // });
              },
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: RichText(
                  text: TextSpan(
                    text: 'Your Habits ',
                    style: Theme.of(context).textTheme.headline6,
                    children: <TextSpan>[
                      TextSpan(
                        text: ' 5',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.apply(color: Colors.grey, fontSizeFactor: 1.2),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => HabitDetailsView(),
                        ),
                      );
                    },
                    child: const HabitListTitle(
                      fill: 10,
                      color: Colors.deepPurple,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
