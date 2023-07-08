import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

Widget calendarTable({
  required DateTime? today,
  required DateTime focused,
  required Function(DateTime day, DateTime focusedDay) onDaySelected,
}) {
  return TableCalendar(
    focusedDay: focused,
    firstDay: DateTime.now(),
    lastDay: DateTime(2025, 12, 31),
    currentDay: today,
    rowHeight: 48,
    headerStyle: HeaderStyle(
      formatButtonVisible: false,
      titleCentered: true,
    ),
    availableCalendarFormats: const {
      CalendarFormat.month: 'Month',
    },
    calendarStyle: const CalendarStyle(
      todayDecoration:
          BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
    ),
    onDaySelected: onDaySelected,
  );
}
