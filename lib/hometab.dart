import 'package:flutter/material.dart';
import 'package:mycoldstaff/account.dart';
import 'package:mycoldstaff/attendencelist.dart';
import 'package:mycoldstaff/home.dart';
import 'package:mycoldstaff/participants.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _selectedIndex = 0;
  List pages = [
    const Home(),
    const AttendenceList(),
    const Participants(),
    const Account()
  ];

  _changeTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => _changeTab(index),
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list),label: 'Attendance'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Participates'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
    );
  }
}
