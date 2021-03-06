import 'package:koolhealthymobile/models/User.dart';

import '../RepasInt.dart';
import '../appbar.dart';
import 'package:flutter/material.dart';
import '../drawer.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;


class MenuVegan extends StatefulWidget {
  final bool connected;
  final User user;

  const MenuVegan({
    Key key,
    @required this.connected,
    @required this.user,
  }) : super(key: key);

  @override
  _MenuVeganState createState() => _MenuVeganState();
}

class _MenuVeganState extends State<MenuVegan> {
  Future<List> getRepasPoulet() async {
    var url = "http://10.0.2.2/projetpfe/getRepasVegan.php";
    http.Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    return jsonData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, widget.connected, widget.user),
      drawer: drawer(context, widget.connected, widget.user),
      body: FutureBuilder<List>(
        future: getRepasPoulet(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(list: snapshot.data, connected: widget.connected,user: widget.user,)
              : new Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios),
        backgroundColor: Theme.of(context).buttonColor,
        onPressed: () {
          Navigator.pop(context);
        },
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
    return new ListView.builder(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return Container(
            padding: EdgeInsets.all(10.0),
            child: Card(
              elevation: 7.0,
              child: new ListTile(
                title: Text(list[i]['nom']),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/img/veg${i+1}.png'),
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.deepPurple),
                subtitle: Text("Prix : ${list[i]['prix']} DT | Type : ${list[i]['type']}".toUpperCase()),
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
                        image: Image(image: AssetImage('assets/img/veg${i+1}.png')),
                        price: list[i]['prix'],
                        calories: list[i]['cal_val'],
                        protein: list[i]['prot_val'],
                        fats: list[i]['fat_val'],
                        carbs: list[i]['carb_val'],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        });
  }


}
