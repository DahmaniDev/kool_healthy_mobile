import 'package:koolhealthymobile/models/User.dart';
import 'package:http/http.dart' as http;
import '../appbar.dart';
import 'package:flutter/material.dart';
import '../drawer.dart';
import 'MessageSent.dart';

class Partnership extends StatefulWidget {
  final bool connected;
  final User user;

  const Partnership({
    Key key,
    @required this.connected,
    @required this.user
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PartnershipState();
  }
}

class PartnershipState extends State<Partnership>{

  int _radioValue = -1;
  String type;
  TextEditingController emailC = new TextEditingController();
  TextEditingController nomC = new TextEditingController();

  void handleRadioChange(int value){
    setState(() {
      _radioValue = value;
    });
  }
  void addMessage() {
    var url = "http://10.0.2.2/projetpfe/addMessage.php";
    DateTime dateNow = DateTime.now();
    String dateToSend = "${dateNow.year}-${dateNow.month}-${dateNow.day}";
    if(_radioValue == 0){
      type='Restaurant';
    }else{
      type='Traiteur';
    }

    http.post(url,body: {
      'email': emailC.text,
      'nom' : nomC.text,
      'date' : dateToSend,
      'type' : "Partenariat",
      'contenu' : type
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, widget.connected, widget.user),
      drawer: drawer(context, widget.connected, widget.user),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 15.0),
                child: Text(
                  'Devenir un partenaire',
                  style: TextStyle(
                    fontFamily: 'Bebas',
                    fontSize: 35,
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 10),
              ),
              Container(
                width: 250,
                height: 80,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: 'E-mail'),
                  controller: emailC,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, bottom: 5),
              ),
              Container(
                height: 80,
                width: 250,
                child: TextField(
                    decoration: InputDecoration(labelText: 'Nom du restaurant'),
                    controller: nomC,
                ),
              ),
              Text(
                'Vous êtes :',
                style: TextStyle(
                  fontFamily: 'poppins',
                  fontSize: 15,
                ),
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: 0,
                    groupValue: _radioValue,
                    onChanged: handleRadioChange,
                  ),
                  Text(
                      'Restaurant'
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: 1,
                    groupValue: _radioValue,
                    onChanged: handleRadioChange,
                  ),
                  Text(
                      'Traiteur'
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: 10.0,
                    left: MediaQuery.of(context).size.width * 0.55),
                child: MaterialButton(
                  onPressed: () {
                    addMessage();
                    Navigator.pushReplacement(
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
