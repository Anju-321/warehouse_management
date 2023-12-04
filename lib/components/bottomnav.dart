import 'package:flutter/material.dart';
import 'package:ware_house_management/components/color.dart';
import 'package:ware_house_management/pages/History/history.dart';
import 'package:ware_house_management/pages/home_page.dart';

class BottomNavigations extends StatefulWidget {
  const BottomNavigations({super.key});

  @override
  State<BottomNavigations> createState() => _BottomNAvigations();
}

class _BottomNAvigations extends State<BottomNavigations> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Center(child: Icon(Icons.home, size: 45)), label: ""),
            BottomNavigationBarItem(
                icon: Center(child: Icon(Icons.history, size: 45)), label: "")
          ],
          backgroundColor: blackClr,
          currentIndex: _currentIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.white,
          selectedIconTheme: const IconThemeData(color: Colors.blue),
          unselectedIconTheme: const IconThemeData(color: Colors.white),
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              if (_currentIndex == 0) {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Homepage()));
              } else {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const History()));
              }
            });
          },
        ),
        Positioned(
          left: MediaQuery.of(context).size.width / 2 - 1,
          top: 0,
          bottom: 0,
          child: Container(
            height: 0.5,
            width: 1,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
