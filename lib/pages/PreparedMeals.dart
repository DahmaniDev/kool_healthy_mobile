
import 'package:koolhealthymobile/pages/MenuFruitsDeMer.dart';
import 'package:koolhealthymobile/pages/MenuPoulet.dart';
import 'package:koolhealthymobile/pages/MenuVegan.dart';

import '../appbar.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../drawer.dart';



class PreparedMeals extends StatefulWidget {
  final bool connected;

  const PreparedMeals({
    Key key,
    @required this.connected,
  }) : super(key: key);

  @override
  _PreparedMealsState createState() => _PreparedMealsState();
}

class _PreparedMealsState extends State<PreparedMeals> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: myAppBar(context, widget.connected),
      drawer: drawer(context, widget.connected),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(25, 30, 25, 25),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: 100,
                    height: 100,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Theme.of(context).primaryColor.withAlpha(50),
                    ),
                    child: Icon(
                      Icons.business_center,
                      color: Theme.of(context).buttonColor,
                      size: 55,
                    )
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                ),
                Center(
                  child: Text(
                    'Vous trouverez ici notre menu des repas préparés',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 18,
                      fontFamily: 'Bebas',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                ),
                Divider(
                  height: 25,
                  color: Colors.grey[300],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'CATEGORIES',
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 24,
                        fontFamily: 'Bebas',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.business_center, color: Theme.of(context).accentColor,)
                  ],
                ),
                Container(
                  height: 250,
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: ListView(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      StatCard(
                        title: 'Poulet',
                        type: 'Repas à base poulet',
                        color: Color(0XFFad4d01),
                        image: Image.asset('assets/img/bolt.png', width: 20),
                        connected: widget.connected,
                      ),
                      StatCard(
                        title: 'Fruits de mer',
                        type: 'Repas à base fruits de mer',
                        color: Colors.deepPurple,
                        image: Image.asset('assets/img/fish.png', width: 20),
                        connected: widget.connected,
                      ),
                      StatCard(
                        title: 'Végétarien',
                        type: 'Repas végétariens',
                        color: Colors.green,
                        image: Image.asset('assets/img/sausage.png', width: 20),
                        connected: widget.connected,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String type;
  //final double total;
  //final double achieved;
  final Image image;
  final Color color;
  final bool connected;

  const StatCard({
    Key key,
    @required this.title,
    @required this.type,
    //@required this.total,
    //@required this.achieved,
    @required this.image,
    @required this.color,
    @required this.connected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print('$type pressed');
        if(type == 'Repas à base poulet'){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MenuPoulet(connected: connected),
            ),
          );
        }
        if(type == 'Repas à base fruits de mer'){
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MenuFruitsDeMer(connected: connected),
              ),
            );

        }
        if(type == 'Repas végétariens'){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MenuVegan(connected: connected),
            ),
          );

        }
      },
      child: Container(
        width: 200,
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey[200],
            width: 1,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  title.toUpperCase(),
                  style: TextStyle(
                    color: Theme.of(context).accentColor.withAlpha(100),
                    fontSize: 14,
                  ),
                ),
                /*achieved < total
                    ? Image.asset(
                  'assets/img/down_orange.png',
                  width: 20,
                )
                    : Image.asset(
                  'assets/img/up_red.png',
                  width: 20,
                ),*/
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 25),
            ),
            CircularPercentIndicator(
              radius: 80.0,
              lineWidth: 8.0,
              percent: 1.0,
              circularStrokeCap: CircularStrokeCap.round,
              center: image,
              progressColor: color,
              backgroundColor: Theme.of(context).accentColor.withAlpha(30),
            ),
            Padding(
              padding: EdgeInsets.only(top: 25),
            ),
            RichText(
              text: TextSpan(
                text: type,
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).accentColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
