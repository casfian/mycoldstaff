import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 300,
              height: 200,
              color: Colors.amber,
            ),
            Container(
              width: 370,
              height: 200,
              
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 178, 212, 240),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //container1
                  Container(
                    width: 100,
                    height: 160,
                    color: Colors.white,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('Byte Sized'),
                          Text('Challenges'),
                          Icon(Icons.person),
                        ],
                      ),
                    ),
                  ),
                  //container2
                  Container(
                    width: 100,
                    height: 160,
                    color: Colors.white,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('Byte Sized'),
                          Text('Challenges'),
                          Icon(Icons.person),
                        ],
                      ),
                    ),
                  ),
                  //container3
                  Container(
                    width: 100,
                    height: 160,
                    color: Colors.white,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('Byte Sized'),
                          Text('Challenges'),
                          Icon(Icons.person),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}
