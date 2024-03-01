import 'package:flutter/material.dart';
import 'package:gym/screens/auth.dart';
import 'package:gym/screens/home.dart';
import 'domain/workout.dart';

void main() => runApp(GymApp());

class GymApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gym App',
      theme: ThemeData(
          primaryColor: Color.fromRGBO(50, 65, 85, 1),
          textTheme: TextTheme(subtitle1: TextStyle(color: Colors.white))),
      home: AuthorizationPage(),
    );
  }
}
