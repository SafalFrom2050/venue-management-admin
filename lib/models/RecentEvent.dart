import 'package:admin/constants.dart';
import 'package:flutter/material.dart';

class RecentEventInfo {
  final String? title, date;
  final double? capacity, attendees;
  final Color? color;

  RecentEventInfo({
    this.title,
    this.date,
    this.capacity,
    this.attendees,
    this.color,
  });
}

List demoRecentEvents = [
  RecentEventInfo(
      title: "Wedding",
      date: "21 March",
      color: warningColor,
      capacity: 300,
      attendees: 150),
  RecentEventInfo(
      title: "Anniversary",
      date: "2 March",
      color: dangerColor,
      capacity: 100,
      attendees: 80),
  RecentEventInfo(
      title: "Birthday",
      date: "2 january",
      color: Color(0xFFA4CDFF),
      capacity: 300,
      attendees: 30),
  RecentEventInfo(
      title: "New Year Party",
      date: "7 feb",
      color: Color(0xFFA4CDFF),
      capacity: 300,
      attendees: 20)
];
