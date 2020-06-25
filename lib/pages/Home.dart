import '../ArticleInt.dart';
import '../appbar.dart';
import 'package:flutter/material.dart';
import '../drawer.dart';

class Home extends StatelessWidget {

  final bool connected;

  const Home({
    Key key,
    @required this.connected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar(context, connected),
        drawer: drawer(context, connected),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 15.0),
                ),
                Card(
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: (){
                        Navigator.push(context,  MaterialPageRoute(builder: (context){
                          return ArticleInt(
                            title: 'Que faisons-nous ?',
                            description: 'C\'est un service qui calcule vos besoins caloriques, nous l\'adaptons à vos préférences alimentaires que vous choisissez et ensuite nous préparons et livrons vos repas sains et équilibrés.',
                            connected: connected,
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
                      ),
                    )
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                ),
                Card(
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: (){
                        Navigator.push(context,  MaterialPageRoute(builder: (context){
                          return ArticleInt(
                            title: 'Comment ça marche?',
                            description: '1- Nous calculons vos besoins \n2- Vous choisissez votre repas désiré et confirmez votre commande \n3- Nous préparons votre repas et nous vous livrons à domicile',
                            connected: connected,
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
                      ),
                    )
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                ),
                Card(
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: (){
                        Navigator.push(context,  MaterialPageRoute(builder: (context){
                          return ArticleInt(
                            title: 'Quel est notre objectif?',
                            description: 'Aidez les gens à préparer leurs repas sains lorsqu\'ils sont occupés au travail, à l\'école ou n\'importe où.',
                            connected: connected,
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
                      ),
                    )
                ),
              ],
            ),
          ),
        ));
  }
}
