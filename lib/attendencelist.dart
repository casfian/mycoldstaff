import 'package:flutter/material.dart';

class AttendenceList extends StatefulWidget {
  AttendenceList({super.key});

  @override
  State<AttendenceList> createState() => _AttendenceListState();
}

class _AttendenceListState extends State<AttendenceList> {
  List eventList = ['Event1', 'Event2', 'Event3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Attendence List'),
        ),
        body: ListView.builder(
          itemCount: eventList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(eventList[index]),
            );
          },
        ));
  }
}
