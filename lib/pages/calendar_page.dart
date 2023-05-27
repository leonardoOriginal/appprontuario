import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../models/event_model.dart';
import '../utils/appbar.dart';
import '../utils/drawer.dart';
import '../utils/faker_api.dart';

var now = DateTime.now();
var firstDay = DateTime(now.year, now.month - 12, now.day);
var lastDay = DateTime(now.year, now.month + 12, now.day);
CalendarFormat format = CalendarFormat.month;
DateTime currentMonth = DateTime.now();

bool load = false;
List<AppEvent> events = [];

var focusedDay = DateTime.now();
var selectedDay = DateTime.now();

LinkedHashMap<DateTime, List<AppEvent>>? _groupedEvents;

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  void initState() {
    super.initState();
    addSchedules();

    focusedDay = selectedDay;
  }

  List<dynamic> _getEventsForDay(DateTime date) {
    return _groupedEvents?[date] ?? [];
  }

  Future addSchedules() async {
    await FakerApi.getData().then((schedules) {
      for (var i = 0; i < schedules.length; i++) {
        events.add(AppEvent(
          date: DateTime.parse(schedules[i].birthday),
          title: schedules[i].firstname,
          description: schedules[i].birthday,
        ));
      }

      setState(() {
        load = true;
      });
    });
    _groupEvents(events);
  }

  int getHashCode(DateTime key) {
    return key.day * 100000 + key.month * 10002 + key.year;
  }

  _groupEvents(List<AppEvent> events) {
    _groupedEvents = LinkedHashMap(equals: isSameDay, hashCode: getHashCode);
    for (var event in events) {
      DateTime date = DateTime.utc(
          event.date!.year, event.date!.month, event.date!.day, 12);
      if (_groupedEvents![date] == null) _groupedEvents![date] = [];
      _groupedEvents![date]!.add(event);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: MyDrawer(),
      appBar: MyAppBar(),
      body: Column(
        children: [
          TableCalendar(
            eventLoader: _getEventsForDay,
            onDaySelected: (newSelectedDay, newFocusedDay) {
              setState(() {
                selectedDay = newSelectedDay;
                focusedDay = newFocusedDay;
                currentMonth =
                    DateTime(newSelectedDay.year, newSelectedDay.month);
              });
            },
            selectedDayPredicate: (day) => isSameDay(day, selectedDay),
            onFormatChanged: (CalendarFormat _format) {
              setState(() {
                format = _format;
              });
            },
            focusedDay: currentMonth,
            firstDay: firstDay,
            lastDay: lastDay,
            locale: 'pt_BR',
            calendarFormat: format,
            availableCalendarFormats: const {
              CalendarFormat.month: "mês",
              CalendarFormat.week: "semana",
              CalendarFormat.twoWeeks: "2 semanas"
            },
            headerStyle: HeaderStyle(
              leftChevronIcon: const Icon(
                Icons.chevron_left,
                size: 32,
                color: Color(0xFF00A896),
              ),
              rightChevronIcon: const Icon(
                Icons.chevron_right,
                size: 32,
                color: Color(0xFF00A896),
              ),
              headerPadding: EdgeInsets.all(20),
              formatButtonVisible: true,
              formatButtonShowsNext: false,
              formatButtonDecoration: BoxDecoration(
                  color: Colors.blueGrey,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(15)),
              formatButtonTextStyle:
                  const TextStyle(color: Colors.white, fontSize: 12),
              titleTextStyle: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w900,
                fontFamily: 'Montserrat',
                color: Color(0xFF00A896),
              ),
              titleCentered: true,
            ),
            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: Colors.blueGrey,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
              ),
              selectedTextStyle: const TextStyle(
                color: Color.fromRGBO(238, 230, 226, 1),
              ),
              todayDecoration: BoxDecoration(
                color: Colors.grey.shade300,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
              ),
              todayTextStyle: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
              defaultDecoration: const BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.rectangle,
              ),
              defaultTextStyle: const TextStyle(
                color: Colors.black,
              ),
              weekendDecoration: const BoxDecoration(
                  color: Colors.transparent, shape: BoxShape.rectangle),
              weekendTextStyle: const TextStyle(color: Colors.black),
            ),
            calendarBuilders: CalendarBuilders(
              dowBuilder: (context, day) {
                String text;
                if (day.weekday == DateTime.sunday) {
                  text = 'D';
                } else if (day.weekday == DateTime.monday) {
                  text = 'S';
                } else if (day.weekday == DateTime.tuesday) {
                  text = 'T';
                } else if (day.weekday == DateTime.wednesday) {
                  text = 'Q';
                } else if (day.weekday == DateTime.thursday) {
                  text = 'Q';
                } else if (day.weekday == DateTime.friday) {
                  text = 'S';
                } else if (day.weekday == DateTime.saturday) {
                  text = 'S';
                } else {
                  text = 'err';
                }
                return Center(
                  child: Text(
                    text,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                );
              },
              markerBuilder: (context, day, events) {
                if (events.length < 6) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        bottom: 2.0,
                        child: Container(
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        bottom: 2.0,
                        child: Container(
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/cadastro_consulta");
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    horizontal: 80.0, vertical: 20.0),
                textStyle: const TextStyle(fontSize: 20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'Nova consulta',
              ),
            ),
          ),
          Expanded(
              child: GridView.count(
            crossAxisCount: 1,
            childAspectRatio: 5 / 1,
            children: [
              ..._getEventsForDay(selectedDay).map((event) => Card(
                    color: Colors.blueGrey,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: ListTile(
                      title: Text(
                        event.title.toString(),
                        style: const TextStyle(
                            color: Colors.white, fontSize: 15.0),
                        textAlign: TextAlign.center,
                      ),
                      subtitle: Text(
                        event.description.toString(),
                        style: const TextStyle(
                            color: Colors.white, fontSize: 15.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ))
            ],
          ))
        ],
      ),
    );
  }
}
