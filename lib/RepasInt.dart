import 'appbar.dart';
import 'drawer.dart';
import 'package:flutter/material.dart';

class RepasInt extends StatelessWidget {
  final String title;
  final String type;
  final String price;
  final String calories;
  final String protein;
  final String fats;
  final String carbs;
  final Image image;
  final bool connected;
  final user;

  const RepasInt({
    Key key,
    @required this.title,
    @required this.type,
    @required this.image,
    @required this.price,
    @required this.calories,
    @required this.protein,
    @required this.fats,
    @required this.carbs,
    @required this.connected,
    @required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar(context, connected, user),
        drawer: drawer(context, connected, user),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: this.image,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  title.toUpperCase(),
                  style: TextStyle(
                      fontSize: 20.0, color: Theme.of(context).accentColor),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 10.0, right: 8.0, top: 20, bottom: 20.0),
                child: Text(
                  'Prix : $price DT\nType: $type\nValeurs nutritifs : \n Calories : $calories Kcal\n Protéine : $protein g\n Graisses : $fats g\n Carbohydrates : $carbs Kcal',
                  style: TextStyle(color: Colors.black87, fontSize: 18.0),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 50.0, left: 150),
                child: connected
                    ? MaterialButton(
                        onPressed: () {},
                        minWidth: 70.0,
                        height: 50,
                        child: Text(
                          'Commander'.toUpperCase(),
                        ),
                        color: Theme.of(context).buttonColor,
                        textColor: Colors.white,
                      )
                    : Text('Vous devez connecter en ordre de commander une repas')
              )
            ],
          ),
        ));
  }
}
