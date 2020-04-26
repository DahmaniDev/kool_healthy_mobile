
import '../appbar.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../drawer.dart';



class PreparedMeals extends StatefulWidget {
  @override
  _PreparedMealsState createState() => _PreparedMealsState();
}

class _PreparedMealsState extends State<PreparedMeals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: myAppBar(context),
      drawer: drawer(context),
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
                Text(
                  'Get Your Favorite Healthy Meal',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 25,
                    fontFamily: 'Bebas',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                ),
                Divider(
                  height: 25,
                  color: Colors.grey[300],
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'PRICE',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '10',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Theme.of(context).accentColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' DT',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'CALORIES',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '259',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Theme.of(context).accentColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' Kcal',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Protein',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '150',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Theme.of(context).accentColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' g',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
                    Icon(Icons.arrow_drop_down, color: Theme.of(context).accentColor,)
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
                        title: 'Meat',
                        //achieved: 200,
                        //total: 350,
                        type: 'Meat Based Meal',
                        color: Colors.orange,
                        image: Image.asset('assets/img/bolt.png', width: 20),
                      ),
                      StatCard(
                        title: 'Fish',
                        type: 'Fish Based Meal',
                        //achieved: 350,
                        //total: 300,
                        color: Theme.of(context).primaryColor,
                        image: Image.asset('assets/img/fish.png', width: 20),
                      ),
                      StatCard(
                        title: 'Vegan',
                        type: 'Vegan Based Meal',
                        //achieved: 100,
                        //total: 200,
                        color: Colors.green,
                        image: Image.asset('assets/img/sausage.png', width: 20),
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

  const StatCard({
    Key key,
    @required this.title,
    @required this.type,
    //@required this.total,
    //@required this.achieved,
    @required this.image,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print('$type pressed');
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
