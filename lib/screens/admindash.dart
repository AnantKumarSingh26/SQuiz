import 'package:flutter/material.dart';

class admindash extends StatelessWidget {
  const admindash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Hello, Admin - Welcome',
          style: TextStyle(fontWeight: FontWeight.bold,
            fontSize:20,
            foreground: Paint()
              ..shader = LinearGradient(
                colors: [
                  const Color.fromARGB(255, 249, 237, 1),
                  const Color.fromARGB(255, 255, 255, 255),
                ],
              ).createShader(Rect.fromLTWH(0, 0, 200, 50)),
        ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/admin.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            
          ),
          ),
        ),
    );
  }
}
