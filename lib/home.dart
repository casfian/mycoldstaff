import 'package:flutter/material.dart';
import 'package:mycoldstaff/scanattendance.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MYCOLD Staff App'),
        actions: [
          IconButton(
              onPressed: () {
                //scan
                MaterialPageRoute route =
                    MaterialPageRoute(builder: (context) => const Scanattendance());
                Navigator.push(context, route);
              },
              icon: const Icon(Icons.photo_camera))
        ],
      ),
      body: const Center(child: Text('Home')),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Attendance',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.group), label: 'Participates'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
    );
  }
}
