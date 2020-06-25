import 'appbar.dart';
import 'drawer.dart';
import 'package:flutter/material.dart';

class ArticleInt extends StatelessWidget {
  final String title;
  final String description;
  final Image image;
  final bool connected;

  const ArticleInt({
    Key key,
    @required this.title,
    @required this.description,
    @required this.image,
    @required this.connected,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar(context, connected),
        drawer: drawer(context, connected),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
              ),
              this.image,
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
              ),
              Text(
                title.toUpperCase(),
                style: TextStyle(
                    fontSize: 20.0, color: Theme.of(context).accentColor),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 8.0, top: 20, bottom: 20.0),
                child: Text(
                  description,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 15.0
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        )
    );
  }
}
