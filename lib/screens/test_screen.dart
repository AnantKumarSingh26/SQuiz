import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  final List<Map<String, String>> tests = [
    {'title': 'Math Quiz', 'description': 'Algebra • Geometry • Arithmetic'},
    {'title': 'Science Test', 'description': 'Physics • Chemistry • Biology'},
    {'title': 'History Challenge', 'description': 'Ancient • Medieval • Modern'},
    {'title': 'Language Skills', 'description': 'Grammar • Vocabulary • Reading'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🧠 Swipe to Choose a Test'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: SizedBox(
          height: 220, // Height of the card container
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: tests.length,
            itemBuilder: (context, index) {
              final test = tests[index];
              return Container(
                width: 280,
                margin: EdgeInsets.symmetric(horizontal: 12),
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  color: Colors.teal.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.teal,
                              child: Icon(Icons.quiz, color: Colors.white),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                test['title']!,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal.shade800,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Text(
                          test['description']!,
                          style: TextStyle(fontSize: 15, color: Colors.black87),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              // Navigate to test screen
                            },
                            icon: Icon(Icons.play_arrow),
                            label: Text('Start'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              shape: StadiumBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}