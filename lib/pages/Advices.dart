import 'package:koolhealthymobile/models/User.dart';

import '../appbar.dart';
import 'package:flutter/material.dart';
import '../drawer.dart';
import '../ArticleInt.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class Articles extends StatefulWidget {
  final bool connected;
  final User user;

  const Articles({
    Key key,
    @required this.connected,
    @required this.user,
  }) : super(key: key);

  @override
  _ArticlesState createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {

  Future<List> getArticles() async {
    var url = "http://10.0.2.2/projetpfe/getArticle.php";
    http.Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    return jsonData;
  }

  Future<List> getRecettes() async {
    var url = "http://10.0.2.2/projetpfe/getRecette.php";
    http.Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    return jsonData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: myAppBar(context, widget.connected, widget.user),
      drawer: drawer(context, widget.connected, widget.user),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.fromLTRB(25, 30, 25, 25),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                Text(
                  'Actualités',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 28,
                    fontFamily: 'Bebas',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                FutureBuilder<List>(
                  future: getArticles(),
                  builder: (context, snapshot){
                    if (snapshot.hasError) print(snapshot.error);
                    return snapshot.hasData
                        ? ArticleList(list: snapshot.data, connected: widget.connected, user: widget.user,)
                        : new Center(child: CircularProgressIndicator());
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                Text(
                  'Recettes',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 28,
                    fontFamily: 'Bebas',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                FutureBuilder<List>(
                  future: getRecettes(),
                  builder: (context, snapshot){
                    if (snapshot.hasError) print(snapshot.error);
                    return snapshot.hasData
                        ? ArticleList(list: snapshot.data, connected: widget.connected, user: widget.user,)
                        : new Center(child: CircularProgressIndicator());
                  },
                ),
              ],
            )),
      ),
    );
  }
}

class ArticleCard extends StatelessWidget {
  final String title;
  final String description;
  final bool connected;
  final Image image;
  final User user;

  const ArticleCard({
    Key key,
    @required this.title,
    @required this.description,
    @required this.image,
    @required this.connected,
    @required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,  MaterialPageRoute(builder: (context){
          return ArticleInt(
            title: title,
            description: description,
            connected: connected,
            image: image,
            user: user,
          );
        }));
      },
      child: Container(
        width: 250,
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Theme.of(context).primaryColorLight,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 60),
            ),
            RichText(
              text: TextSpan(
                text: title,
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

class ArticleList extends StatelessWidget{
  final List list;
  final bool connected;
  final User user;

  ArticleList({this.list, this.connected, this.user});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 250,
      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: ListView.builder(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount : list == null ? 0 : list.length,
          itemBuilder: (context, i){
            return ArticleCard(
              title: list[i]['titre'],
              description: list[i]['contenu'],
              connected: connected,
              user: user,
              image: Image.asset(
                'assets/img/logo.png',
                width: 300,
              ),
            );
          }
      ),
    );
  }
}
