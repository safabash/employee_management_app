// import 'dart:html';

import 'package:employee_management_app/shared/theme/color_manager.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorManagerLight.scaffoldBgColor,
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${DateFormat("MMM, yyyy").format(_focusedDay)}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Row(
                children: [
                  Material(
                    color: Colors
                        .transparent, // Make sure the background is transparent
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _focusedDay =
                              DateTime(_focusedDay.year, _focusedDay.month - 1);
                        });
                      },
                      child: Icon(
                        Icons.chevron_left,
                        color: ColorManagerLight.textColor,
                      ),
                    ),
                  ),
                  SizedBox(width: 8), // Add some space between the icons
                  Material(
                    color: Colors
                        .transparent, // Make sure the background is transparent
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _focusedDay =
                              DateTime(_focusedDay.year, _focusedDay.month + 1);
                        });
                      },
                      child: Icon(
                        Icons.chevron_right,
                        color: ColorManagerLight.textColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          TableCalendar(
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2010),
            lastDay: DateTime.utc(2040),
            headerVisible: false,
            onFormatChanged: (result) {},
            daysOfWeekStyle: DaysOfWeekStyle(
              dowTextFormatter: (date, locale) {
                return DateFormat("EEE").format(date).toUpperCase();
              },
              weekendStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorManagerLight.redColor),
              weekdayStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorManagerLight.textColor),
            ),
            onPageChanged: (day) {
              _focusedDay = day;
              setState(() {});
            },
            calendarStyle: CalendarStyle(
              defaultTextStyle: TextStyle(color: ColorManagerLight.textColor),
              todayDecoration: BoxDecoration(
                color: ColorManagerLight.primaryColor,
                shape: BoxShape.circle,
              ),
              markerDecoration: BoxDecoration(
                color: ColorManagerLight.primaryColor,
                shape: BoxShape.circle,
              ),
            ),
            // eventLoader: (day) {
            //   ///make event on 22 and 12 date every month
            //   if (day.day == 22 || day.day == 12) {
            //     return [Event("Event Name", canBubble: true)];
            //   }
            //   return [];
            // },
          )
        ],
      ),
    );
  }
}
