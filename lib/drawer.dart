import 'pages/Partnership.dart';
import 'pages/Advices.dart';
import 'pages/ContactUs.dart';
import 'pages/PreparedMeals.dart';
import 'package:flutter/material.dart';
import 'pages/CalculateMN.dart';
import 'pages/Home.dart';

Widget drawer(context) {
  return Drawer(
    elevation: 1.0,
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          //color: Color(0XFFc0cfc2),
            child: Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.1),
              ),
              ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Theme.of(context).buttonColor,
                  ),
                  title: Text(
                    'Home',
                    style: TextStyle(color: Theme.of(context).buttonColor),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return Home();
                        }));
                  }),
              ListTile(
                leading: Icon(
                  Icons.assessment,
                  color: Theme.of(context).buttonColor,
                ),
                title: Text(
                  'Calculate My Needs',
                  style: TextStyle(color: Theme.of(context).buttonColor),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CalculateMyNeeds();
                  }));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.business_center,
                  color: Theme.of(context).buttonColor,
                ),
                title: Text(
                  'Prepared Meals',
                  style: TextStyle(color: Theme.of(context).buttonColor),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PreparedMeals();
                  }));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.done_outline,
                  color: Theme.of(context).buttonColor,
                ),
                title: Text(
                  'Advices',
                  style: TextStyle(color: Theme.of(context).buttonColor),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Advices();
                  }));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.contact_mail,
                  color: Theme.of(context).buttonColor,
                ),
                title: Text(
                  'Contact Us',
                  style: TextStyle(color: Theme.of(context).buttonColor),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ContactUs();
                  }));
                },
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.33,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.restaurant,
                  color: Theme.of(context).buttonColor,
                ),
                title: Text(
                  'Partnership',
                  style: TextStyle(color: Theme.of(context).buttonColor),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Partnership();
                  }));
                },
              ),
            ]))
      ],
    ),
  );
}
