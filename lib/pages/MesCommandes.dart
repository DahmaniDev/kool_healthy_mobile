import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:koolhealthymobile/pages/Profile.dart';
import '../models/User.dart';

class MesCommandesPage extends StatefulWidget {
  final User user;

  const MesCommandesPage({
    Key key,
    @required this.user,
  }) : super(key: key);

  @override
  MesCommandesPageState createState() => MesCommandesPageState(this.user);
}

class MesCommandesPageState extends State<MesCommandesPage>
    with SingleTickerProviderStateMixin {
  User user;
  final FocusNode myFocusNode = FocusNode();

  MesCommandesPageState(this.user);

  Future<List> getCommandes() async {
    final response = await http.post(
        "http://10.0.2.2/projetpfe/getCommandesUser.php",
        body: {'userID': user.id.toString()});
    var dataUser = json.decode(response.body);

    return dataUser;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //iconTheme: new IconThemeData(color: Theme.of(context).buttonColor),
        elevation: 8,
        backgroundColor: Colors.white,
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              // Replace with sign in interface
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProfilePage(user: user);
              }));
            },
            child: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Container(
                  width: 35,
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Theme.of(context).buttonColor,
                    size: 35,
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: FutureBuilder<List>(
        future: getCommandes(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(list: snapshot.data, user: widget.user)
              : new Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }
}

class ItemList extends StatelessWidget {
  final List list;
  final User user;

  ItemList({this.list, this.user});

  int _status;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: new ListView.builder(
          shrinkWrap: true,
          addRepaintBoundaries: true,
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.all(16.0),
          itemCount: list == null ? 0 : list.length,
          itemBuilder: (context, i) {
            if (list[i]['status'] == 'En attente') {
              _status = 0;
            } else if (list[i]['status'] == 'En cours de préparation') {
              _status = 1;
            } else if (list[i]['status'] == 'En route') {
              _status = 2;
            } else if (list[i]['status'] == 'Livré') {
              _status = 3;
            }
            return Padding(
              padding: EdgeInsets.all(5.0),
              child: Card(
                elevation: 7.0,
                child: new ListTile(
                  title: Text(list[i]['adresse'] ?? "Adresse : --- "),
                  leading: CircleAvatar(
                      backgroundColor: Colors.lightGreenAccent,
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: (_status == 0)
                                ? Image(image: AssetImage('assets/preparing.png'))
                                : (_status == 1)
                                    ? Image(
                                        image: AssetImage('assets/cooking.png'))
                                    : (_status == 2)
                                        ? Image(
                                            image: AssetImage(
                                                'assets/deliveryGUY.png'))
                                        : Image(
                                            image: AssetImage(
                                                'assets/done.png'))),
                      )),
                  trailing: Padding(
                      padding: EdgeInsets.all(8),
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.deepOrange, width: 1)
                        ),
                        child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text('Prix : ${list[i]['prix_comm']} DT' ??
                                "Prix : --- DT")),
                      )),
                  subtitle: Text(
                        "Date : ${list[i]['date_livraison']} | Temps : ${list[i]['temps_livraison']}" ??
                            "Date : --- | Temps : ---"),
                  onTap: () {
                    showModalBottomSheet(context: context, builder: (ctx) => _buildBottomSheet(
                        ctx,
                        int.parse(list[i]['id'], onError: (source) => -1),
                        list[i]['adresse'],
                        list[i]['date_livraison'],
                        list[i]['temps_livraison'].toString(),
                        int.parse(list[i]['id_repas'], onError: (source) => -1),
                        int.parse(list[i]['id_traiteur'], onError: (source) => -1),
                        list[i]['status'],
                        list[i]['prix_comm'],
                    ));
                  },
                ),
              ),
            );
          }),
    );
  }

  Container _buildBottomSheet(BuildContext context, int idC, String adresse, String date, String time, int idR, int idT, String status, String price){
    return Container(
      height: 500,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54, width: 3.0),
      ),
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Commande : 000$idC'),
          ),
          ListTile(
            title: Text('Adresse : $adresse'),
            leading: Icon(Icons.home),
          ),
          ListTile(
            title: Text('Date : $date | Temps : $time'),
            leading: Icon(Icons.access_time),
          ),
          ListTile(
            title: Text('ID-Repas : $idR'),
            leading: Icon(Icons.business_center),
          ),
          ListTile(
            title: Text('ID-Traiteur : $idT'),
            leading: Icon(Icons.restaurant),
          ),
          ListTile(
            title: Text('Prix : $price'),
            leading: Icon(Icons.attach_money),
          ),
          ListTile(
            title: Text('Status : $status'),
            leading: Icon(Icons.beenhere),
          ),
          Container(
            alignment: Alignment.center,
            child: RaisedButton.icon(
                onPressed: () {}, //DOWNLOAD PDF FILE HERE
                icon: Icon(Icons.save),
                label: Text('Télecharger PDF'),
                color: Colors.orangeAccent,
            ),
          )
        ],
      ),
    );
  }
}
