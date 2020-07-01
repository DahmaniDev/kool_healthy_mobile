import 'package:koolhealthymobile/models/User.dart';

import '../ArticleInt.dart';
import '../appbar.dart';
import 'package:flutter/material.dart';
import '../drawer.dart';

class Home extends StatelessWidget {

  final bool connected;
  final User user;

  const Home({
    Key key,
    @required this.connected,
    @required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar(context, connected, user),
        drawer: drawer(context, connected, user),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 30.0),
                ),
                Text(
                  'Welcome'.toUpperCase(),
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Theme.of(context).buttonColor,
                      fontStyle: FontStyle.italic
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15.0),
                ),
                Card(
                    elevation: 5.0,
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [Color(0XFFf59362), Colors.white70])
                      ),
                      child: MaterialButton(
                        onPressed: (){
                          Navigator.push(context,  MaterialPageRoute(builder: (context){
                            return ArticleInt(
                              title: 'Que faisons-nous ?',
                              description: 'C\'est un service qui calcule vos besoins caloriques, nous l\'adaptons à vos préférences alimentaires que vous choisissez et ensuite nous préparons et livrons vos repas sains et équilibrés.',
                              connected: connected,
                              user: user,
                              image: Image.asset(
                                'assets/img/logo.png',
                                width: 300,
                              ),
                            );
                          }));
                        },
                        minWidth: double.infinity,
                        height: 150,
                        child: Text(
                          'Que faisons-nous ?'.toUpperCase(),
                          style: TextStyle(
                            fontSize: 19.0,
                            fontFamily: 'Sans-serif'
                          ),
                        ),
                      ),
                    )
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                ),
                Card(
                    elevation: 5.0,
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [Color(0XFFf59362), Colors.white70])
                      ),
                      child: MaterialButton(
                        onPressed: (){
                          Navigator.push(context,  MaterialPageRoute(builder: (context){
                            return ArticleInt(
                              title: 'Comment ça marche?',
                              description: '1- Nous calculons vos besoins \n2- Vous choisissez votre repas désiré et confirmez votre commande \n3- Nous préparons votre repas et nous vous livrons à domicile',
                              connected: connected,
                              user: user,
                              image: Image.asset(
                                'assets/img/logo.png',
                                width: 300,
                              ),
                            );
                          }));
                        },
                        minWidth: double.infinity,
                        height: 150,
                        child: Text(
                          'Comment ça marche?'.toUpperCase(),
                          style: TextStyle(
                              fontSize: 19.0,
                              fontFamily: 'Sans-serif'
                          ),
                        ),
                      ),
                    )
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                ),
                Card(
                    elevation: 5.0,
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [Color(0XFFf59362), Colors.white70])
                      ),
                      child: MaterialButton(
                        onPressed: (){
                          Navigator.push(context,  MaterialPageRoute(builder: (context){
                            return ArticleInt(
                              title: 'Quel est notre objectif?',
                              description: 'Aidez les gens à préparer leurs repas sains lorsqu\'ils sont occupés au travail, à l\'école ou n\'importe où.',
                              connected: connected,
                              user: user,
                              image: Image.asset(
                                'assets/img/logo.png',
                                width: 300,
                              ),
                            );
                          }));
                        },
                        minWidth: double.infinity,
                        height: 150,
                        child: Text(
                          'Quel est notre objectif?'.toUpperCase(),
                          style: TextStyle(
                              fontSize: 19.0,
                              fontFamily: 'Sans-serif'
                          ),
                        ),
                      ),
                    )
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 30.0),
                ),
                Text(
                    'Gallery'.toUpperCase(),
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Theme.of(context).buttonColor,
                      fontStyle: FontStyle.italic
                  ),
                ),
                Container(
                  height: 250,
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: ListView(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10.0),
                      ),
                      Card(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context).buttonColor,
                                width: 1.0
                              )
                            ),
                            child: Image(
                              image: AssetImage('assets/img/chick4.png'),
                            ),
                          ),
                        elevation: 11.0,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                      ),
                      Card(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).buttonColor,
                                  width: 1.0
                              )
                          ),
                          child: Image(
                            image: AssetImage('assets/img/veg4.png'),
                          ),
                        ),
                        elevation: 11.0,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                      ),
                      Card(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).buttonColor,
                                  width: 1.0
                              )
                          ),
                          child: Image(
                            image: AssetImage('assets/img/fdm3.png'),
                          ),
                        ),
                        elevation: 11.0,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                      ),
                      Card(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).buttonColor,
                                  width: 1.0
                              )
                          ),
                          child: Image(
                            image: AssetImage('assets/img/veg3.png'),
                          ),
                        ),
                        elevation: 11.0,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                      ),
                      Card(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).buttonColor,
                                  width: 1.0
                              )
                          ),
                          child: Image(
                            image: AssetImage('assets/img/chick10.png'),
                          ),
                        ),
                        elevation: 11.0,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom : 20.0),
                ),
                Text(
                  'Reviews'.toUpperCase(),
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Theme.of(context).buttonColor,
                      fontStyle: FontStyle.italic
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom : 20.0),
                ),
                Container(
                  height: 250,
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: ListView(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10.0),
                      ),
                      Container(
                        width: 300,
                        child: Card(
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                child: Image(
                                    image: AssetImage('assets/img/reviews.png'),
                                    width: 70,
                                    height: 70,
                                  ),
                                top: 5,
                                left: 110,
                              ),
                              Positioned(
                                child: Text(
                                  'Ismail Ben Haj Khalifa',
                                  style: TextStyle(
                                    color: Theme.of(context).buttonColor
                                  ),
                                ),
                                top: 90,
                                left: 70,
                              ),
                              Positioned(
                                child: Text(
                                  'Professeur de Marketing',
                                  style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontSize: 11
                                  ),
                                ),
                                top: 110,
                                left: 75,
                              ),
                              Positioned(
                                child: Text(
                                  'Je viens de commencer à travailler, \net Kool Healthy a sauvé mon régime. \nMerci infiniment',
                                  style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontSize: 13
                                  ),
                                ),
                                top: 140,
                                left: 30,
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                      ),
                      Container(
                        width: 300,
                        child: Card(
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                child: Image(
                                  image: AssetImage('assets/img/reviews.png'),
                                  width: 70,
                                  height: 70,
                                ),
                                top: 5,
                                left: 110,
                              ),
                              Positioned(
                                child: Text(
                                  'Oussama Zayati',
                                  style: TextStyle(
                                      color: Theme.of(context).buttonColor
                                  ),
                                ),
                                top: 90,
                                left: 90,
                              ),
                              Positioned(
                                child: Text(
                                  'Ingénieur Informatique',
                                  style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontSize: 11
                                  ),
                                ),
                                top: 110,
                                left: 85,
                              ),
                              Positioned(
                                child: Text(
                                  'Plan parfait pour un dîner sain à la maison\nsans aucune difficulté.',
                                  style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontSize: 13
                                  ),
                                ),
                                top: 140,
                                left: 10,
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                      ),
                      Container(
                        width: 300,
                        child: Card(
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                child: Image(
                                  image: AssetImage('assets/img/reviews.png'),
                                  width: 70,
                                  height: 70,
                                ),
                                top: 5,
                                left: 110,
                              ),
                              Positioned(
                                child: Text(
                                  'Assil Bouzouita',
                                  style: TextStyle(
                                      color: Theme.of(context).buttonColor
                                  ),
                                ),
                                top: 90,
                                left: 90,
                              ),
                              Positioned(
                                child: Text(
                                  'Étudiant',
                                  style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontSize: 11
                                  ),
                                ),
                                top: 110,
                                left: 120,
                              ),
                              Positioned(
                                child: Text(
                                  'L\'un des meilleurs repas que j\'ai eu, bien \npréparé et bien livré. Merci Kool Healthy',
                                  style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontSize: 13
                                  ),
                                ),
                                top: 140,
                                left: 10,
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom : 20.0),
                ),
                Text(
                  'Contact'.toUpperCase(),
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Theme.of(context).buttonColor,
                      fontStyle: FontStyle.italic
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom : 20.0),
                ),
                ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text('kool-healthy-contact@gmail.com'),
                    ),
                    ListTile(
                      leading: Icon(Icons.call),
                      title: Text('52680290'),
                    ),
                    ListTile(
                      leading: Icon(Icons.location_on),
                      title: Text('5000, Monastir, Tunisia'),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
