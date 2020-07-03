import 'appbar.dart';
import 'drawer.dart';
import 'package:flutter/material.dart';

class RepasInt extends StatefulWidget {
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
  _RepasIntState createState() => _RepasIntState();
}

class _RepasIntState extends State<RepasInt> {
  TextEditingController adresseC = new TextEditingController();
  TextEditingController dateC = new TextEditingController();
  TextEditingController tempsC = new TextEditingController();
  bool _commander = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar(context, widget.connected, widget.user),
        drawer: drawer(context, widget.connected, widget.user),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(right: 320),
          child: FloatingActionButton(
            child: Icon(Icons.arrow_back_ios),
            backgroundColor: Theme.of(context).buttonColor,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: this.widget.image,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  widget.title.toUpperCase(),
                  style: TextStyle(
                      fontSize: 20.0, color: Theme.of(context).accentColor),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 10.0, right: 8.0, top: 20, bottom: 20.0),
                child: Text(
                  'Prix : ${widget.price} DT\nType: ${widget.type}\nValeurs nutritifs : \n Calories : ${widget.calories} Kcal\n Protéine : ${widget.protein} g\n Graisses : ${widget.fats} g\n Carbohydrates : ${widget.carbs} Kcal',
                  style: TextStyle(color: Colors.black87, fontSize: 18.0),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 50.0, left: 150),
                  child: widget.connected
                      ? _commander
                          ? MaterialButton(
                              onPressed: () {
                                setState(() {
                                  _commander = false;
                                });
                              },
                              minWidth: 70.0,
                              height: 50,
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.cancel),
                                  Padding(
                                    padding: EdgeInsets.only(left: 30.0),
                                  ),
                                  Text(
                                    'Annuler'.toUpperCase(),
                                  ),
                                ],
                              ),
                              color: Colors.black26,
                              textColor: Colors.white,
                            )
                          : MaterialButton(
                              onPressed: () {
                                setState(() {
                                  _commander = true;
                                });
                              },
                              minWidth: 70.0,
                              height: 50,
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.shopping_cart),
                                  Padding(
                                    padding: EdgeInsets.only(left: 30.0),
                                  ),
                                  Text(
                                    'Commander'.toUpperCase(),
                                  ),
                                ],
                              ),
                              color: Theme.of(context).buttonColor,
                              textColor: Colors.white,
                            )
                      : Text(
                          'Vous devez connecter en ordre de commander une repas')),
              _commander
                  ? Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 5, left: 20, right : 20),
                          child: TextField(
                            decoration: const InputDecoration(
                              hintText: "Adresse",
                              icon: Icon(Icons.location_on),
                            ),
                            controller: adresseC,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15, left: 20, right : 20),
                          child: TextField(
                            decoration: const InputDecoration(
                              hintText: "Date de livraison",
                              icon: Icon(Icons.calendar_today),
                            ),
                            controller: dateC,
                            onTap: (){
                              DateTime now = DateTime.now();
                              showDatePicker(
                                  context: context,
                                  initialDate: now,
                                  firstDate: now,
                                  lastDate: new DateTime(now.year, now.month, now.day+30)
                              ).then((DateTime onValue){
                                if(onValue != null ){
                                  dateC.text = "${onValue.year}-${onValue.month}-${onValue.day}";
                                }
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15, left: 20, right : 20),
                          child: TextField(
                            decoration: const InputDecoration(
                              hintText: "Temps de livraison",
                              icon: Icon(Icons.access_time),
                            ),
                            controller: tempsC,
                            onTap: (){
                              DateTime now = DateTime.now();
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay(hour: now.hour, minute: now.minute)
                              ).then((TimeOfDay value){
                                if(value != null){
                                  tempsC.text = "${value.format(context)}";
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20.0),
                          width: 250,
                          height: 85,
                          child: RaisedButton.icon(
                            elevation: 10,
                            onPressed: () {}, //commander
                            icon: Icon(Icons.verified_user, color: Colors.white,),
                            label: Text('Confirmer', style: TextStyle(color: Colors.white),),
                            color: Theme.of(context).buttonColor,
                          ),
                        ),
                      ],
                    )
                  : Container(),
            ],
          ),
        ));
  }
}
