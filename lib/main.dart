import 'package:flutter/material.dart';
import 'package:habitpunk/pages/home_page.dart';
import 'package:habitpunk/pages/addhabit_page.dart';
import 'package:habitpunk/pages/fight_page.dart';
import 'package:habitpunk/pages/reward_page.dart';
import 'package:habitpunk/pages/daily_page.dart';
import 'package:habitpunk/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure Flutter bindings are initialized
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions
        .currentPlatform, // Use platform-specific Firebase options
  );
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return NavigationScreen(currentIndex: 0); // User is logged in
            }
            return LoginScreen(); // User is not logged in
          }
          return Scaffold(body: Center(child: CircularProgressIndicator())); // Loading state
        },
      ),
    );
  }
}

class NavigationScreen extends StatefulWidget {
  NavigationScreen({required this.currentIndex});
  int currentIndex;
  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

const List<Widget> screens = [
  HomePage(),
  DailyPage(),
  AddHabitPage(),
  RewardPage(),
  FightPage()
];

class _NavigationScreenState extends State<NavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: widget.currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.deepPurpleAccent,
        currentIndex: widget.currentIndex,
        onTap: (index) {
          setState(() {
            widget.currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: "Dailies"),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: "Add"),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: "Rewards"),
          BottomNavigationBarItem(
              icon: Icon(Icons.pan_tool_outlined), label: "Fight")
        ],
      ),
    );
  }
}
