import 'package:flutter/material.dart';

class AttendenceList extends StatelessWidget {
  const AttendenceList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendence List'),
      ),
      body: const Center(
        child: Text('ListView'),
      ),
    );
  }
}
