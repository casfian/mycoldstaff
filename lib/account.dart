import 'package:flutter/material.dart';
import 'package:mycoldstaff/scanattendance.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        actions: [
          IconButton(
              onPressed: () {
                //scan
                MaterialPageRoute route = MaterialPageRoute(
                    builder: (context) => const Scanattendance());
                Navigator.push(context, route);
              },
              icon: const Icon(Icons.photo_camera))
        ],
      ),
      body: const Center(
        child: Text('Account'),
      ),
    );
  }
}
