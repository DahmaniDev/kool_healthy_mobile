import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../RepasInt.dart';
import '../appbar.dart';
import '../drawer.dart';
import 'package:koolhealthymobile/models/User.dart';
import 'package:http/http.dart' as http;

class PrepareMyMeal extends StatefulWidget {
  final bool connected;
  final User user;
  final double calories;


  const PrepareMyMeal({
    Key key,
    @required this.connected,
    @required this.user,
    @required this.calories,

  }) : super(key: key);

  @override
  _PrepareMyMealState createState() => _PrepareMyMealState();
}

class _PrepareMyMealState extends State<PrepareMyMeal> {
  bool error = false;


  Future<List> getMesRepas() async {
    var url = "http://10.0.2.2/projetpfe/getMesRepas.php";
    int val = widget.calories.round();

    final response = await http.post(url, body: {
      'calories' : val.toString(),
    });

    var jsonData = jsonDecode(response.body);
    if (jsonData.length == 0) {
      setState(() {
        error = true;
      });
    }

    return jsonData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: myAppBar(context, widget.connected, widget.user),
      drawer: drawer(context, widget.connected, widget.user),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.fromLTRB(25, 10, 25, 25),
          child: Column(
              children: <Widget>[
                Icon(
                  Icons.business_center,
                  color: Colors.blue,
                  size: 55,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                Center(
                  child: Text(
                    'Vous trouverez ici votre menu bien préparés',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 20,
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
                error
                    ? Container(
                        padding: EdgeInsets.all(50.0),
                        child: Image(
                          image: AssetImage('assets/oops.png'),
                        ),
                      )
                    : FutureBuilder<List>(
                        future: getMesRepas(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError){
                            print('Error !!!!!!! ${snapshot.error}');
                            error = true;
                          }
                          return snapshot.hasData
                              ? new ItemList(
                                  list: snapshot.data,
                                  connected: widget.connected,
                                  user: widget.user,
                                )
                              : new Center(child: CircularProgressIndicator());
                        },
                      )
              ],
            ),
        ),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  final bool connected;
  final User user;

  ItemList({this.list, this.connected, this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom : 15.0),
      child: SizedBox(
        height: 480,
        child: ListView.builder(
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: list == null ? 0 : list.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Card(
                    elevation: 7.0,
                    child: new ListTile(
                      title: Text(list[i]['nom']),
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/plate1.png'),
                        backgroundColor: Colors.deepOrange,
                      ),
                      trailing:
                          Icon(Icons.arrow_forward_ios, color: Colors.deepPurple),
                      subtitle: Text(
                          "Prix : ${list[i]['prix']} DT | Type : ${list[i]['type']}"
                              .toUpperCase()),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RepasInt(
                              id: int.parse(list[i]['id']),
                              idTr: int.parse(list[i]['id_traiteur']),
                              title: list[i]['nom'],
                              connected: connected,
                              user: user,
                              type: list[i]['type'],
                              image: Image(image: AssetImage('assets/plate1.png')),
                              price: list[i]['prix'].toString(),
                              calories: list[i]['cal_val'].toString(),
                              protein: list[i]['prot_val'].toString(),
                              fats: list[i]['fat_val'].toString(),
                              carbs: list[i]['carb_val'].toString(),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
        ),
      ),
    );
  }
}
