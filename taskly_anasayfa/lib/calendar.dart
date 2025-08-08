import 'package:flutter/material.dart';
import 'package:taskly_anasayfa/mainScaffold.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  int key = 2;
  Widget build(BuildContext context) {
    return MainScaffold(
        body: Center(
          child: Text(
            'Takvim',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
    selectedIndex: 0,
      onTabSelected: (index) {
        setState(() {
          key = index;
        });
      },
    );
  }
}
