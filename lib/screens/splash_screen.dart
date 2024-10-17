import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _initializeFirebaseAndCheckAuth();
  }

  Future<void> _initializeFirebaseAndCheckAuth() async {
    try {
      // Add a delay to ensure the splash screen is shown for at least 2 seconds
      await Future.delayed(const Duration(seconds: 2));

      // Initialize Firebase
      await Firebase.initializeApp();

      // Check if there's a currently logged-in user
      User? user = FirebaseAuth.instance.currentUser;

      // Check if the widget is still mounted before using the context
      if (!mounted) return;

      // Navigate based on authentication state
      if (user != null) {
        // User is logged in, navigate to HomeScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        // User is not logged in, navigate to LoginScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    } catch (e) {
      // Check if the widget is still mounted before using the context
      if (!mounted) return;

      // Show an error message if there's a problem initializing Firebase
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Something went wrong! Please try again later.',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the app's logo
            Image.asset(
              'assets/images/logo.png',
              height: 150, // Adjust the size as needed
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
