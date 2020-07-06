import 'package:flutter/material.dart';
import 'package:koolhealthymobile/models/Traiteur.dart';
import 'package:koolhealthymobile/pages/SignIn.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeTraiteur extends StatefulWidget {

  final Traiteur traiteur;

  const HomeTraiteur({
    Key key,
    @required this.traiteur,
  }) : super(key: key);

  @override
  _HomeTraiteurState createState() => _HomeTraiteurState();
}

class _HomeTraiteurState extends State<HomeTraiteur> {

  bool _empty = false;

  Future<List> getCommandes() async {
    final response = await http.post(
        "http://10.0.2.2/projetpfe/getCommandesTraiteur.php",
        body: {'traiteurID': widget.traiteur.id.toString()});
    var dataTr = json.decode(response.body);
    if (dataTr.length == 0) {
      setState(() {
        _empty = true;
      });
    }

    return dataTr;
  }

  @override
  Widget build(BuildContext context) {

    final _tabsBody = <Widget>[
      _empty
      ? Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.deepOrange),))
      : FutureBuilder<List>(
        future: getCommandes(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(list: snapshot.data)
              : new Center(child: CircularProgressIndicator());
        },
      )
       ,
      Center(child: Icon(Icons.add_box, color: Colors.deepOrange, size: 64.0),),

    ];
    final _tabs = <Tab>[
      Tab(icon: Icon(Icons.shopping_cart), text: 'Mes Commandes',),
      Tab(icon: Icon(Icons.add_box), text: 'Ajouter Repas',),

    ];

    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.restaurant),
          title: Text('Bienvenue ${widget.traiteur.nom}'),
          backgroundColor: Theme.of(context).buttonColor,
          actions: <Widget>[
            PopupMenuButton(
              itemBuilder: (BuildContext context){
                return [
                  PopupMenuItem(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      width: double.infinity,
                      child: FlatButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.info),
                        label: Text('Infos'),
                        color: Colors.white,
                  ),
                    ),
                  ),
                  PopupMenuItem(
                    child: Container(
                      alignment: Alignment.topLeft,
                      width: double.infinity,
                      child: FlatButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.content_paste),
                        label: Text('Contact Admin'),
                        color: Colors.white,
                  ),
                    ),
                  ),
                  PopupMenuItem(
                    child: Container(
                      alignment: Alignment.topLeft,
                      width : double.infinity,
                      child: FlatButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.exit_to_app),
                        label: Text('Déconnecter'),
                        color: Colors.white,
                  ),
                    ),
                  )
                ];
              },
            )
          ],
          elevation: 11,
          bottom: TabBar(
            tabs: _tabs,
          ),
        ),
        body: TabBarView(
          children: _tabsBody,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ItemList extends StatelessWidget {
  final List list;

  ItemList({this.list});

  int _status;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
          if (list.length == 0) {
            return Padding(
              padding: EdgeInsets.all(30.0),
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: EdgeInsets.all(5.0),
              child: Card(
                elevation: 7.0,
                child: new ListTile(
                  title: Text('ID-Commande : 000${list[i]['id']}' ?? "ID COMMANDE : --- "),
                  leading: Icon(Icons.payment),
                  trailing: (_status == 0)
                  ? Icon(Icons.arrow_drop_down_circle, color: Colors.blueGrey,)
                      : (_status == 1)
                  ? Icon(Icons.arrow_drop_down_circle, color: Colors.redAccent,)
                      : (_status == 2)
                  ? Icon(Icons.arrow_drop_down_circle, color: Colors.blue,)
                      : Icon(Icons.arrow_drop_down_circle, color: Colors.green,)
                  ,
                  subtitle: Text(
                      "Date : ${list[i]['date_livraison']} | Temps : ${list[i]['temps_livraison']}" ??
                          "Date : --- | Temps : ---"),
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (ctx) =>
                            _buildBottomSheet(
                              ctx,
                              int.parse(list[i]['id'], onError: (source) => -1),
                              list[i]['adresse'],
                              list[i]['date_livraison'],
                              list[i]['temps_livraison'].toString(),
                              int.parse(list[i]['id_repas'],
                                  onError: (source) => -1),
                              list[i]['status'],
                              list[i]['prix_comm'],
                            ));
                  },
                ),
              ),
            );
          }
        });
  }

  Container _buildBottomSheet(BuildContext context, int idC, String adresse,
      String date, String time, int idR, String status, String price) {
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
