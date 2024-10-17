import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _checkIfLoggedIn(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Imagen del logo
                  Image.asset(
                    'assets/images/logo.png',
                    height: 150, // Ajusta el tamaño según sea necesario
                  ),
                  const SizedBox(height: 20), // Espacio entre el logo y el indicador de carga
                  const CircularProgressIndicator(), // Indicador de carga
                ],
              ),
            ),
          );
        } else {
          // Agregar un delay mínimo de 2 segundos
          return FutureBuilder(
            future: Future.delayed(const Duration(seconds: 3)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Scaffold(
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          height: 150,
                        ),
                        const SizedBox(height: 20),
                        const CircularProgressIndicator(),
                      ],
                    ),
                  ),
                );
              } else {
                // Redirigir según el estado de autenticación
                if (FirebaseAuth.instance.currentUser != null) {
                  return HomeScreen();
                } else {
                  return LoginScreen();
                }
              }
            },
          );
        }
      },
    );
  }

  Future<bool> _checkIfLoggedIn() async {
    User? user = FirebaseAuth.instance.currentUser;
    return user != null;
  }
}
