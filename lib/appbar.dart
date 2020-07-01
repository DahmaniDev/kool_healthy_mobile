import 'package:koolhealthymobile/pages/SignIn.dart';

import './pages/Profile.dart';
import 'package:flutter/material.dart';

import 'models/User.dart';

Widget myAppBar(context, bool connected, User user) {
  return AppBar(
    iconTheme: new IconThemeData(color: Theme.of(context).buttonColor),
    elevation: 0,
    backgroundColor: Colors.white,
    actions: <Widget>[
      connected
          ? FlatButton(
              onPressed: () {
                // Replace with sign in interface
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProfilePage(user: user);
                }));
              },
              child: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Container(
                    width: 35,
                    child: Icon(
                      Icons.person,
                      color: Theme.of(context).buttonColor,
                      size: 35,
                    ),
                  )
                ],
              ),
            )
          : FlatButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SignIn();
                }));
              },
              child: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Container(
                    width: 95,
                    child: Text(
                      'Connecter'.toUpperCase(),
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Theme.of(context).buttonColor,
                        fontSize: 15
                      ),
                    )
                  ),
                ],
              ),
            ),
    ],
  );
}
