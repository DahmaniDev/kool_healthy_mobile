import 'package:koolhealthymobile/models/User.dart';

import '../appbar.dart';
import 'package:flutter/material.dart';
import '../drawer.dart';


class MessageSent extends StatelessWidget {
  final bool connected;
  final User user;

  const MessageSent({
    Key key,
    @required this.connected,
    @required this.user,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context,connected, user),
      drawer: drawer(context,connected, user),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 15.0),
                child: Text(
                  'Merci',
                  style: TextStyle(
                    fontFamily: 'Bebas',
                    fontSize: 35,
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Votre message a été envoyé ! Nous tenons à vous remercier de nous avoir choisi \nNous vous contacterons bientôt',
                  style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: 30.0,
                    left: MediaQuery.of(context).size.width * 0.55),
                child: Text(
                  'Equipe de Kool Healthy :)',
                  style: TextStyle(
                    color: Theme.of(context).buttonColor
                  ),
                )
              ),

            ],
          ),
        ),
      ),
    );
  }

}

