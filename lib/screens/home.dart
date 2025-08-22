import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          const activity(),
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
  int selectedYear = DateTime.now().year;
  int seletecMonth = DateTime.now().month;

  final List <int> completedDays=[1,2,4,21,12,23,30,8,15];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
        boxShadow:[
          BoxShadow(color: Colors.black.withOpacity(0.4),blurRadius: 6)
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DropdownButton<int>(
                value: selectedYear ,
                items: [2023,2024,2025,2026]
                .map((year)=>DropdownMenuItem(
                  value: year,
                  child: Text(year.toString())
                  )).toList(), 
                  onChanged: (value){
                      setState(() {
                        selectedYear=value!;
                      }
                    );
                  }
                ),
                DropdownButton<int>(value:seletecMonth,
                items: List.generate(12, (index)=>index + 1)
                .map((month)=>DropdownMenuItem(
                  value:month,
                  child: Text(DateFormat.MMMM().format(DateTime(0,month))),
                  )).toList(), onChanged:(value){
                    setState(() {
                      seletecMonth=value!;
                    });
                  } )
            ],
          ),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Su"),
              Text("Mo"),
              Text("Tu"),
              Text("We"),
              Text("Th"),
              Text("Fr"),
              Text("Sa"),
            ],
          ),

          

        ],
      ),
    );
  }
}