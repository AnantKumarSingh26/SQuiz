import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> exams = [
    {'title': 'SSC CHSL', 'route': '/chsl'},
    {'title': 'SSC CGL', 'route': '/cgl'},
    {'title': 'SSC MTS', 'route': '/mts'},
    {'title': 'SSC Steno', 'route': '/steno'},
    {'title': 'UPPET', 'route': '/uppet'},
    {'title': 'TET', 'route': '/tet'},
    {'title': 'CTET', 'route': '/ctet'},
  ];
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Welcome to a New Journey',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            foreground:
                Paint()
                  ..shader = LinearGradient(
                    colors: [
                      const Color.fromARGB(255, 83, 90, 227),
                      const Color.fromARGB(255, 220, 19, 255),
                    ], // Your gradient colors
                  ).createShader(Rect.fromLTWH(0100, 100, 200, 170)), //
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image3.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(16),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children:
                    exams.map((exam) {
                      return ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, exam['route']);
                        },
                        child: Text(exam['title']),
                      );
                    }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
