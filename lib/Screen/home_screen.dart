import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soft_bd_assignment/Screen/calender_screen.dart';
import 'package:soft_bd_assignment/Screen/dashboard_screen.dart';
import 'package:soft_bd_assignment/Screen/profile_screen.dart';
import 'package:soft_bd_assignment/Screen/schedule_screen.dart';
import 'package:soft_bd_assignment/provider/navigation_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> Screens = [
    DashBoardScreen(),
    CalanderScreen(),
    ScheduleScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    // final navigationProvider = Provider.of<NavigationProvider>(context);
    print("Build from Home Screen");
    return Consumer<NavigationProvider>(
      builder: (context, value, child) {
        return Scaffold(
          body: Screens[value.index],
          floatingActionButton: ClipOval(
            child: Container(
              width: 56.0,
              height: 56.0,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.greenAccent, Colors.green],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    // Your onPressed action here
                  },
                  child: const Center(
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              // shape: BoxShape.rectangle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, -1),
                ),
              ],
            ),
            child: BottomNavigationBar(
              elevation: 0,
              currentIndex: value.index,
              // showUnselectedLabels: false,
              // showSelectedLabels: false,
              enableFeedback: false,
              // selectedItemColor: Colors.black,
              showSelectedLabels: true,
              selectedLabelStyle: TextStyle(
                height: .5,
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Colors.greenAccent,
              ),
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    value.index == 0
                        ? "assets/home_active.png"
                        : "assets/home_inactive.png",
                    width: 24,
                    height: 24,
                  ),
                  label: value.index == 0 ? "." : "",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    value.index == 1
                        ? "assets/calendar_active.png"
                        : "assets/calendar_inactive.png",
                    width: 24,
                    height: 24,
                  ),
                  label: value.index == 1 ? "." : "",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    // value.index == 2
                    //     ? "assets/calender_active.png"
                    "assets/menu_schedule.png",
                    width: 24,
                    height: 24,
                  ),
                  label: value.index == 2 ? "." : "",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    value.index == 3
                        ? "assets/person_active.png"
                        : "assets/person_inactive.png",
                    width: 24,
                    height: 24,
                  ),
                  label: value.index == 3 ? "." : "",
                ),
              ],
              onTap: (val) {
                value.setIndex(val);
              },
            ),
          ),
        );
      },
    );
  }
}
