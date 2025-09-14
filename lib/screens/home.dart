import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'test_screen.dart';
import 'package:squiz/widgets/graph.dart';
import 'package:fl_chart/fl_chart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int selectedYear = DateTime.now().year;
  int selectedMonth = DateTime.now().month;

  final List<int> completedDays = [1, 2, 4, 21, 12, 23, 30, 8, 15];

  Color getTabColor(int index) {
    switch (index) {
      case 0:
        return Colors.green.withValues(alpha: 0.6);
      case 1:
        return Colors.red.withValues(alpha: 0.6);
      case 2:
        return Colors.blue.withValues(alpha: 0.6);
      default:
        return Colors.lightGreen;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_sharp)),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
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
                        children: [
                          Row(
                            children: [
                              Text(
                                "Anonymous",
                                style: GoogleFonts.pressStart2p(fontSize: 18),
                              ),
                              SizedBox(width: 6),
                              Icon(Icons.no_accounts),
                            ],
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                "Login to save your progress",
                                style: GoogleFonts.viga(fontSize: 13),
                              ),
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
              const SizedBox(height: 5),
              const activity(),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(
                      255,
                      250,
                      250,
                      251,
                    ).withOpacity(0.6), // Transparent background
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Text(
                    "Total Test Taken :\t 90 \nAverage Marks : \t65 \nHighest Mark : \t99",
                    style: GoogleFonts.viga(
                      color: const Color.fromARGB(255, 66, 64, 64),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      shadows: [
                        Shadow(
                          color: const Color.fromARGB(255, 254, 254, 254),
                          blurRadius: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // StyledMarksGraph(
              //   dataPoints: [
              //     FlSpot(1, 72),
              //     FlSpot(2, 85),
              //     FlSpot(3, 78),
              //     FlSpot(4, 90),
              //     FlSpot(5, 88),
              //   ],
              // ),
            ],
          ),
        ),
      ),
      // ++++++++-----------  BOTTOM NAVIGATION BAR  -----------+++++++++++
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(
              0,
              255,
              255,
              255,
            ).withValues(alpha: 0.7),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.6),
                blurRadius: 10,
                offset: Offset(0, -2),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: GNav(
              gap: 10,
              backgroundColor: const Color.fromARGB(0, 138, 22, 22),
              color: const Color.fromARGB(255, 0, 0, 0),
              activeColor: Colors.white,
              tabBackgroundColor: getTabColor(_selectedIndex),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              tabs: const [
                GButton(
                  icon: Icons.quiz_rounded,
                  text: 'Test',
                  iconColor: Colors.blueAccent,
                  iconSize: 30,
                ),
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                  iconColor: Color.fromARGB(255, 255, 200, 0),
                  iconSize: 30,
                ),
                GButton(
                  icon: Icons.account_circle,
                  text: 'Account',
                  iconColor: Colors.redAccent,
                  iconSize: 30,
                ),
              ],
            ),
          ),
        ),
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
  int selectedMonth = DateTime.now().month;

  final List<int> completedDays = [1, 2, 4, 21, 12, 23, 30, 8, 15];

  @override
  Widget build(BuildContext context) {
    // Calculate the number of days in the selected month and year
    int daysInMonth = DateTime(selectedYear, selectedMonth + 1, 0).day;
    int firstWeekday = DateTime(selectedYear, selectedMonth, 1).weekday;
    int firstWeek = firstWeekday % 7;
    int totalCells = firstWeek + daysInMonth;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 6),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lumen',
              style: GoogleFonts.rubikDistressed(
                fontSize: 30,
                shadows: [
                  Shadow(
                    color: const Color.fromARGB(
                      136,
                      64,
                      64,
                      64,
                    ).withOpacity(0.5),
                    blurRadius: 10,
                  ),
                ],
              ),
            ),
            //dropdown Button for year and month
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton<int>(
                  value: selectedYear,
                  items: [2023, 2024, 2025, 2026]
                      .map(
                        (year) => DropdownMenuItem(
                          value: year,
                          child: Text(year.toString()),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedYear = value!;
                    });
                  },
                ),
                DropdownButton<int>(
                  value: selectedMonth,
                  items: List.generate(12, (index) => index + 1)
                      .map(
                        (month) => DropdownMenuItem(
                          value: month,
                          child: Text(
                            DateFormat.MMMM().format(DateTime(0, month)),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedMonth = value!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text("Su", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Mo", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Tu", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("We", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Th", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Fr", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Sa", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 8),
            //Days Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: totalCells,
              itemBuilder: (context, index) {
                if (index < firstWeek) {
                  return const SizedBox.shrink();
                }
                int day = index - firstWeek + 1;
                bool done = completedDays.contains(day);

                return Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: done
                        ? const Color.fromARGB(255, 9, 180, 37)
                        : Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    day.toString(),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: done
                          ? Colors.white
                          : const Color.fromARGB(255, 252, 2, 2),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
