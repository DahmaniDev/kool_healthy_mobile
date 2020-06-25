import 'package:koolhealthymobile/pages/SignIn.dart';

import './pages/Profile.dart';
import 'package:flutter/material.dart';

Widget myAppBar(context, bool connected) {
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
                  return ProfilePage();
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
                    width: 35,
                    child: Icon(
                      Icons.lock_open,
                      color: Theme.of(context).buttonColor,
                      size: 35,
                    ),
                  ),
                ],
              ),
            ),
    ],
  );
}
