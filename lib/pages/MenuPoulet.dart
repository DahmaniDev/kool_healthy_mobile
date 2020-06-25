import '../appbar.dart';
import 'package:flutter/material.dart';
import '../drawer.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'PreparedMeals.dart';

class MenuPoulet extends StatefulWidget {
  final bool connected;

  const MenuPoulet({
    Key key,
    @required this.connected,
  }) : super(key: key);

  @override
  _MenuPouletState createState() => _MenuPouletState();
}

class _MenuPouletState extends State<MenuPoulet> {
  Future<List> getRepasPoulet() async {
    var url = "http://10.0.2.2/projetpfe/getRepasPoulet.php";
    http.Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    return jsonData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, widget.connected),
      drawer: drawer(context, widget.connected),
      body: FutureBuilder<List>(
          future: getRepasPoulet(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? new ItemList(list: snapshot.data)
                : new Center(child: CircularProgressIndicator());
          },
        ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios),
        backgroundColor: Theme.of(context).buttonColor,
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PreparedMeals(connected: widget.connected),
            ),
          );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;

  ItemList({this.list});

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
                    backgroundImage: AssetImage('assets/img/chick${i+1}.png'),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.deepPurple),
                  subtitle: Text("Prix : ${list[i]['prix']} DT | Type : ${list[i]['type']}".toUpperCase()),

                ),
              ),
            );
          });
  }


}
