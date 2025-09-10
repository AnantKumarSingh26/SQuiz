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
        title: Text('📚 Choose Your Test'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: ListView.builder(
        itemCount: tests.length,
        itemBuilder: (context, index) {
          final test = tests[index];
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              color: Colors.indigo.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.deepPurple,
                          child: Icon(Icons.school, color: Colors.white),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            test['title']!,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'New',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      test['description']!,
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Navigate to test screen
                        },
                        icon: Icon(Icons.play_arrow),
                        label: Text('Start Test'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
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
    );
  }
}