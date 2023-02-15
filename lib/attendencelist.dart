import 'package:flutter/material.dart';
import 'package:mycoldstaff/scanattendance.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AttendenceList extends StatefulWidget {
  const AttendenceList({super.key});

  @override
  State<AttendenceList> createState() => _AttendenceListState();
}

class _AttendenceListState extends State<AttendenceList> {
//declare
  final Stream<QuerySnapshot> _speakersStream =
      FirebaseFirestore.instance.collection('attendence').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Attendence List'),
          actions: [
            IconButton(
                onPressed: () {
                  final fullnameController = TextEditingController();

                  //add Data to FireStore
                  AlertDialog alert = AlertDialog(
                    title: const Text('Add Attendence'),
                    content: SizedBox(
                      width: 300,
                      height: 100,
                      child: Column(
                        children: [
                          TextField(
                            controller: fullnameController,
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () async {
                            //code
                            await FirebaseFirestore.instance
                                .collection('attendence')
                                .add({
                              'fullname': fullnameController.text,
                              'hadir': 'ya'
                            }).then((value) => Navigator.pop(context));
                          },
                          child: const Text('OK'))
                    ],
                  );
                  showDialog(
                      context: context,
                      builder: (context) {
                        return alert;
                      });
                },
                icon: const Icon(Icons.add)),
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
        body: StreamBuilder<QuerySnapshot>(
            stream: _speakersStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Center(child: Text('Ops! Something went wrong'));
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: Text("Loading"));
              }

              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return ListTile(
                    leading: const CircleAvatar(
                      radius: 20.0,
                      backgroundColor: Color.fromARGB(255, 228, 226, 226),
                      // backgroundImage:
                      //     NetworkImage('https://via.placeholder.com/150'),
                      child: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                    ),
                    title: Text(data['fullname']),
                    trailing: const Icon(Icons.check),
                  );
                }).toList(),
              );
            }));
  }
}
