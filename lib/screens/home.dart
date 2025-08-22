import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<bool> progress = [
      true, false, true, true, false, false, true, // Week 1
      false, true, false, true, true, false, false, // Week 2
      true, true, false, false, true, true, true, // Week 3
      false, false, true, false, true, false, true, // Week 4
    ];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_sharp)),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                  ),
                ],
              ),
              //User Icon
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.person,
                      size: 30,
                      color: Color.fromARGB(255, 255, 217, 78),
                    ),
                  ),
                  const SizedBox(width: 16),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Row(
                        children: [
                          Text(
                            "Anonymous",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 6),
                          Icon(Icons.no_accounts),
                        ],
                      ),
                      SizedBox(height: 4),

                      Row(
                        children: [
                          Text("Login to save your progress"),
                          SizedBox(width: 4),
                          Icon(Icons.poll_outlined),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
class activity extends StatefulWidget {
  const activity({super.key});

  @override
  State<activity> createState() => _activityState();
}

class _activityState extends State<activity> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}