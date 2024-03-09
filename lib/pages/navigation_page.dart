// navigation_screen.dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:habitpunk/pages/home_page.dart';
import 'package:habitpunk/pages/addhabit_page.dart';
import 'package:habitpunk/pages/fight_page.dart';
import 'package:habitpunk/pages/reward_page.dart';
import 'package:habitpunk/pages/daily_page.dart';
import 'login_page.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            // User is signed in
            return const MainContent();
          } else {
            // User is not signed in, show login screen
            return LoginScreen();
          }
        }
        // Waiting for authentication state to be available
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}

class MainContent extends StatefulWidget {
  const MainContent({super.key});

  @override
  _MainContentState createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  int currentIndex = 0;

  final screens = [
    const HomePage(),
    const DailyPage(),
    const AddHabitPage(),
    const RewardPage(),
    const FightPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Dailies"),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: "Add"),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: "Rewards"),
          BottomNavigationBarItem(icon: Icon(Icons.security), label: "Fight"),
        ],
      ),
    );
  }
}
