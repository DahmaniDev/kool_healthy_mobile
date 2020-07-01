import 'package:koolhealthymobile/RepasInt.dart';
import 'package:koolhealthymobile/models/User.dart';
import 'package:koolhealthymobile/pages/PreparedMeals.dart';

import '../appbar.dart';
import 'package:flutter/material.dart';
import '../drawer.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class MenuFruitsDeMer extends StatefulWidget {
  final bool connected;
  final User user;

  const MenuFruitsDeMer({
    Key key,
    @required this.connected,
    @required this.user,
  }) : super(key: key);

  @override
  _MenuFruitsDeMerState createState() => _MenuFruitsDeMerState();
}

class _MenuFruitsDeMerState extends State<MenuFruitsDeMer> {
  Future<List> getRepasFruitsDeMer() async {
    var url = "http://10.0.2.2/projetpfe/getRepasFruitsDeMer.php";
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
        future: getRepasFruitsDeMer(),
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
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PreparedMeals(connected: widget.connected,user: widget.user),
            ),
          );
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
                  backgroundImage: AssetImage('assets/img/fdm${i+1}.png'),
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.deepPurple),
                subtitle: Text("Prix : ${list[i]['prix']} DT | Type : ${list[i]['type']}".toUpperCase()),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RepasInt(
                        title: list[i]['nom'],
                        connected: connected,
                        user: user,
                        type: list[i]['type'],
                        image: Image(image: AssetImage('assets/img/fdm${i+1}.png')),
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
