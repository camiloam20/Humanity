import 'package:flutter/material.dart';
import 'package:humanity/pages/explore_page.dart';
import 'package:humanity/pages/inbox_page.dart';
import 'package:humanity/pages/profile_page.dart';
import 'package:humanity/pages/reservation_page.dart';
import 'package:humanity/pages/saved_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    ExplorePage(),
    SavedPage(),
    ReservationPage(),
    InboxPage(),
    ProfilePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.search), label: "Descubre"),
            BottomNavigationBarItem(
                icon: Icon(Icons.heart_broken), label: "Guardado"),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today_outlined), label: "Reservas"),
            BottomNavigationBarItem(
                icon: Icon(Icons.mark_chat_unread_outlined), label: "Mensajes"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "Perfil"),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped
      ),
    );
  }
}
