import 'package:flutter/material.dart';
import 'package:travel_app/screens/splash_screen.dart';
import 'package:travel_app/screens/welcome_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:travel_app/screens/tab_navigation_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Travelify',
          theme: ThemeData(
            primarySwatch: Colors.teal,
          ),
          home: SplashScreen(),
          routes: {
            '/welcome': (context) => WelcomeScreen(),
            '/home': (context) => BottomNavBarSellerView(),
          },
        );
      },
    );
  }
}
