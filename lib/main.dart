import './pages/welcome.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0XFF21D91E),
        //backgroundColor: Color(0XFF),
        accentColor: Color(0XFF1695b5), //Title Color
        buttonColor: Color(0XFF0390FC),
        fontFamily: 'Poppins',
      ),
      home: Welcome(),
    );
  }
}
