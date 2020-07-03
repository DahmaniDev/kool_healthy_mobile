import 'package:koolhealthymobile/models/User.dart';
import 'package:http/http.dart' as http;
import '../appbar.dart';
import 'package:flutter/material.dart';
import '../drawer.dart';
import 'MessageSent.dart';


class ContactUs extends StatefulWidget {
  final bool connected;
  final User user;

  const ContactUs({
    Key key,
    @required this.connected,
    @required this.user,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return ContactUsState();
  }
}

class ContactUsState extends State<ContactUs>{

  final descriptionController = TextEditingController();

  void addMessage() {
    var url = "http://10.0.2.2/projetpfe/addMessage.php";
    DateTime dateNow = DateTime.now();
    String dateToSend = "${dateNow.year}-${dateNow.month}-${dateNow.day}";

    http.post(url,body: {
      'email': widget.user.username,
      'nom' : widget.user.nom,
      'date' : dateToSend,
      'type' : "Contact",
      'contenu' : descriptionController.text,
    }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context,widget.connected, widget.user),
      drawer: drawer(context,widget.connected, widget.user),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 15.0),
                child: Text(
                  'Contacter nous',
                  style: TextStyle(
                    fontFamily: 'Bebas',
                    fontSize: 35,
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
              Padding(
                padding: EdgeInsets.only(
                    bottom: 10.0,
                    left: MediaQuery.of(context).size.width * 0.55),
                child: MaterialButton(
                  onPressed: () {
                    addMessage();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MessageSent(
                            connected: widget.connected,
                            user: widget.user,
                            ),
                      ),
                    );
                  },
                  minWidth: 70.0,
                  height: 50,
                  child: Text(
                    'Envoyer'.toUpperCase(),
                  ),
                  color: Theme.of(context).buttonColor,
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
