import 'package:flutter/material.dart';
import 'package:zoom/screens/metting_history.dart';

import '../utilits/colors.dart';
import 'home_screen.dart';

class NavigationBarConfig extends StatefulWidget {
  const NavigationBarConfig({super.key});

  @override
  State<NavigationBarConfig> createState() => _NavigationBarConfigState();
}

class _NavigationBarConfigState extends State<NavigationBarConfig> {
  CustomColors colors = CustomColors();
  int index = 0;

  onChanged(int pageIndex) {
    setState(() {
      index = pageIndex;
    });
  }

  final screens = const [HomeScreen(), MeetingHistoryScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onChanged,
        type: BottomNavigationBarType.fixed,
        backgroundColor: colors.footerColor,
        selectedItemColor: colors.buttonColor,
        unselectedItemColor: Colors.grey,
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "Meeting",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.woo_commerce),
            label: "chatting",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Contacts",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Setting",
          ),
        ],
      ),
    );
  }
}
