// import 'package:dictonary/api/apiMain.dart';
import 'package:dictonary/screens/setting_page.dart';
import 'package:dictonary/screens/translator_page.dart';
import 'package:dictonary/screens/fav_screen.dart';
import 'package:dictonary/screens/search_screen.dart';
import 'package:flutter/material.dart';

bool isDarkMode = false;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int currentIndex = 0;

  final pages = [Searchscreen(), Translator(), FavouriteScreen(), Setting()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFF101623),
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() => currentIndex = index);
        },
        // backgroundColor: const Color(0xFF101623),
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Color(0xFF101623)
            : Color(0xFFF6F6F8),

        selectedItemColor: const Color.fromARGB(255, 1, 141, 255),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
            icon: Icon(Icons.translate),
            label: "Translate",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
        ],
      ),
    );
  }
}
