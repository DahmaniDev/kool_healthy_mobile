import './pages/welcome.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kool Healthy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0XFFd65106),
        //backgroundColor: Color(0XFF),
        accentColor: Color(0XFF222222), //Title Color
        buttonColor: Color(0XFFd65106),
        fontFamily: 'Poppins',
      ),
      home: Welcome(),
    );
  }
}
