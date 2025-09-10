import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  final List<Map<String, String>> tests = [
    {'title': 'Math Quiz', 'description': 'Algebra, Geometry, Arithmetic'},
    {'title': 'Science Test', 'description': 'Physics, Chemistry, Biology'},
    {'title': 'History Challenge', 'description': 'Ancient to Modern History'},
    {'title': 'Language Skills', 'description': 'Grammar, Vocabulary, Comprehension'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Available Tests')),
      body: ListView.builder(
        itemCount: tests.length,
        itemBuilder: (context, index) {
          final test = tests[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: Icon(Icons.assignment, color: Colors.blueAccent),
              title: Text(test['title']!, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(test['description']!),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to test details or start test
              },
            ),
          );
        },
      ),
    );
  }
}