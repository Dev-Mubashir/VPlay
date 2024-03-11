import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Color.fromARGB(165, 154, 154, 154),
      backgroundColor: Color(0xFF1E1E1E),
      iconSize: 22,
      selectedFontSize: 12,
      unselectedFontSize: 11,
      fixedColor: Colors.white,
      currentIndex: currentIndex, // Bind to the state variable
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.live_tv),
          label: 'Reels',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_books),
          label: 'My Library',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_horiz),
          label: 'More',
        ),
      ],
      onTap: (index) {
        //       if (index == 1) {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(builder: (context) => Reels()),
        //   );
        // }
        setState(() {
          currentIndex = index;
        });
      },
    );
  }
}
