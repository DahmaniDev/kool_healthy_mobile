import '../ArticleInt.dart';
import '../appbar.dart';
import 'package:flutter/material.dart';
import '../drawer.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar(context),
        drawer: drawer(context),
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
                            title: 'What We Do ?',
                            description: 'It\'s a service that calculates your caloric needs, we match that with your food preferences that you pick and then we prepare and deliver your healthy and balanced meal(s).',
                          );
                        }));
                      },
                      minWidth: double.infinity,
                      height: 150,
                      child: Text(
                        'What we do ?'.toUpperCase(),
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
                            title: 'How Does It Work ?',
                            description: '1 - We calculate your needs\n2 - You choose your food ingredients and confirm your order\n3 - We prepare it and deliver it to you',
                          );
                        }));
                      },
                      minWidth: double.infinity,
                      height: 150,
                      child: Text(
                        'How does it work ?'.toUpperCase(),
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
                            title: 'What\'s our goal ?',
                            description: 'To help people prepare their healthy meals while they\'re busy at work, school or anywhere. We also make people more aware about their bosies and what they actually need in their Meals, Nutritional awareness is the key to a healthy life.',
                          );
                        }));
                      },
                      minWidth: double.infinity,
                      height: 150,
                      child: Text(
                        'what\'s our goal ?'.toUpperCase(),
                      ),
                    )
                ),
              ],
            ),
          ),
        ));
  }
}
