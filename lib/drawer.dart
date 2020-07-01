import 'models/User.dart';
import 'pages/Partnership.dart';
import 'pages/Advices.dart';
import 'pages/ContactUs.dart';
import 'pages/PreparedMeals.dart';
import 'package:flutter/material.dart';
import 'pages/CalculateMN.dart';
import 'pages/Home.dart';

Widget drawer(context, bool connected, User user) {
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
                'Accueil',
                style: TextStyle(color: Theme.of(context).buttonColor),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Home(connected: connected, user: user,);
                }));
              }),
          connected
              ? ListTile(
                  leading: Icon(
                    Icons.assessment,
                    color: Theme.of(context).buttonColor,
                  ),
                  title: Text(
                    'Calculer Mes Besoins',
                    style: TextStyle(color: Theme.of(context).buttonColor),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CalculateMyNeeds(
                        connected: connected,
                          user: user
                      );
                    }));
                  },
                )
              : Container(),
          ListTile(
            leading: Icon(
              Icons.business_center,
              color: Theme.of(context).buttonColor,
            ),
            title: Text(
              'Repas Préparés',
              style: TextStyle(color: Theme.of(context).buttonColor),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PreparedMeals(
                  connected: connected,
                    user: user
                );
              }));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.done_outline,
              color: Theme.of(context).buttonColor,
            ),
            title: Text(
              'Articles',
              style: TextStyle(color: Theme.of(context).buttonColor),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Articles(connected: connected, user: user);
              }));
            },
          ),
          connected
              ? ListTile(
            leading: Icon(
              Icons.contact_mail,
              color: Theme.of(context).buttonColor,
            ),
            title: Text(
              'Contact',
              style: TextStyle(color: Theme.of(context).buttonColor),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return ContactUs(
                      connected: connected,
                        user: user
                    );
                  }));
            },
          )
              : Container(),
          connected
              ? Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.33,
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.50,
                  ),
                ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              color: Theme.of(context).buttonColor,
            ),
            title: Text(
              'Partenariat',
              style: TextStyle(color: Theme.of(context).buttonColor),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Partnership(
                  connected: connected,
                    user: user
                );
              }));
            },
          ),
        ]))
      ],
    ),
  );
}
