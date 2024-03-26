import 'package:flutter/material.dart';
import 'package:flutter_todo_app/src/utils/date_util.dart' as date_util;

class CalendarLine extends StatefulWidget {
  final String title;
  const CalendarLine({super.key, required this.title});

  @override
  State<CalendarLine> createState() => _CalendarLineState();
}

class _CalendarLineState extends State<CalendarLine> {
  double width = 0.0;
  double height = 0.0;
  late ScrollController scrollController;
  List<DateTime> currentMonthList = List.empty();
  DateTime currentDateTime = DateTime.now();

  @override
  void initState() {
    currentMonthList = date_util.DateUtils.daysInMonth(currentDateTime);
    currentMonthList.sort((a, b) => a.day.compareTo(b.day));
    currentMonthList
        .removeWhere((element) => element.day <= currentDateTime.day - 1);
    currentMonthList = currentMonthList
      ..toSet()
      ..toList();
    scrollController =
        ScrollController(initialScrollOffset: 70.0 * currentDateTime.day);
    super.initState();
  }

  void setCalendarList(DateTime date) {
    final int currentMonth = DateTime.now().month;
    int firstDay = 0;
    currentMonthList = date_util.DateUtils.daysInMonth(date);
    if (currentMonth == date.month) {
      firstDay = date.day + 1;
      currentMonthList
          .removeWhere((element) => element.day <= currentDateTime.day - 1);
    }

    currentMonthList.sort((a, b) => a.day.compareTo(b.day));

    currentMonthList = currentMonthList
      ..toSet()
      ..toList();

    scrollController.jumpTo(70.0 * firstDay);
  }

  Widget titleView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        currentDateTime.month == DateTime.now().month
            ? Container()
            : IconButton(
                onPressed: () {
                  setState(() {});
                  currentDateTime.month - 1 > 0
                      ? currentDateTime = DateTime(currentDateTime.year,
                          currentDateTime.month - 1, currentDateTime.day)
                      : currentDateTime = DateTime(
                          currentDateTime.year - 1, 12, currentDateTime.day);
                  setCalendarList(currentDateTime);
                },
                icon: const Icon(Icons.chevron_left),
              ),
        Text(
          date_util.DateUtils.months[currentDateTime.month - 1] +
              ' ' +
              currentDateTime.year.toString(),
        ),
        IconButton(
          onPressed: () {
            setState(() {});
            currentDateTime.month + 1 < 13
                ? currentDateTime = DateTime(currentDateTime.year,
                    currentDateTime.month + 1, currentDateTime.day)
                : currentDateTime =
                    DateTime(currentDateTime.year + 1, 1, currentDateTime.day);
            setCalendarList(currentDateTime);
          },
          icon: const Icon(Icons.chevron_right),
        ),
      ],
    );
  }

  Widget hrizontalCapsuleListView() {
    return SizedBox(
      width: width,
      height: 50,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: currentMonthList.length,
        itemBuilder: (BuildContext context, int index) {
          return capsuleView(index);
        },
      ),
    );
  }

  Widget capsuleView(int index) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              currentDateTime = currentMonthList[index];
            });
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: (currentMonthList[index].day != currentDateTime.day)
                  ? Theme.of(context).cardColor
                  : Theme.of(context).primaryColor,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    currentMonthList[index].day.toString(),
                    style: TextStyle(
                        color:
                            (currentMonthList[index].day != currentDateTime.day)
                                ? Colors.black
                                : Colors.white),
                  ),
                  Text(
                    date_util.DateUtils
                        .weekdays[currentMonthList[index].weekday - 1],
                    style: TextStyle(
                        color:
                            (currentMonthList[index].day != currentDateTime.day)
                                ? Colors.black
                                : Colors.white),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Widget topView() {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          titleView(),
          hrizontalCapsuleListView(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return topView();
  }
}
