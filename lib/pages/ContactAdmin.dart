import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:koolhealthymobile/models/Traiteur.dart';

class ContactAdmin extends StatefulWidget {
  final Traiteur traiteur;

  const ContactAdmin({
    Key key,
    @required this.traiteur,
  }) : super(key: key);

  @override
  _ContactAdminState createState() => _ContactAdminState();
}

class _ContactAdminState extends State<ContactAdmin> {

  final descriptionController = TextEditingController();

  void addMessage() {
    var url = "http://10.0.2.2/projetpfe/addMessage.php";
    DateTime dateNow = DateTime.now();
    String dateToSend = "${dateNow.year}-${dateNow.month}-${dateNow.day}";

    http.post(url,body: {
      'email': widget.traiteur.email,
      'nom' : widget.traiteur.nom,
      'date' : dateToSend,
      'type' : "Contact",
      'contenu' : descriptionController.text,
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Contact'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 50.0, bottom: 15.0),
                  child: Text(
                    'Contacter Kool Healthy Admin',
                    style: TextStyle(
                      fontFamily: 'Bebas',
                      fontSize: 25,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Si vous avez des questions ou si vous voulez réclamer à une problème, n\'hésitez pas à nous laisser un message.',
                    style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 15,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                ),
                Container(
                  height: 200,
                  width: 250,
                  child: TextField(
                    maxLines: 4,
                    maxLength: 2500,
                    decoration: InputDecoration(labelText: 'Description'),
                    controller: descriptionController,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
