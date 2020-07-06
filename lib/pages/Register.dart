import 'dart:convert';

import 'package:koolhealthymobile/models/User.dart';

import 'Home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'SignIn.dart';



class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  TextEditingController nomC = new TextEditingController();
  TextEditingController emailC = new TextEditingController();
  TextEditingController passwordC = new TextEditingController();
  TextEditingController passwordVerC = new TextEditingController();
  TextEditingController ageC = new TextEditingController();
  TextEditingController weightC = new TextEditingController();
  TextEditingController heightC = new TextEditingController();
  bool _showPassword = false;
  static var _sexes = ['Homme', 'Femme'];
  String _sexSelected = _sexes[0];
  String _goalSelected = null;
  static var _activities = ['Pas Actif', 'Peu Actif', 'Actif', 'Super Actif'];
  String _activitySelected = null;
  bool _checkboxVal = false;

  void register() async{
    var url = "http://10.0.2.2/projetpfe/register.php";

    final response = await http.post(url,body: {
      'nom' : nomC.text,
      'username' : emailC.text,
      'password' : passwordVerC.text,
      'sexe' : _sexSelected,
      'age' : ageC.text,
      'height' : heightC.text,
      'weight' : weightC.text,
      'goal' : _goalSelected,
      'activity' : _activitySelected
    }
    );
    var dataUser = json.decode(response.body);

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home(
              connected: true,
              user: new User(int.parse(dataUser[0]['id']),dataUser[0]['nom'],dataUser[0]['username'],dataUser[0]['password'],dataUser[0]['sexe'],int.parse(dataUser[0]['age']),int.parse(dataUser[0]['height']),int.parse(dataUser[0]['weight']),dataUser[0]['goal'],dataUser[0]['activity_level'])),
        ),
      );


    //return dataUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD9DCD8),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 20.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 50),
                ),
                Image.asset(
                  'assets/img/logo.png',
                  width: 300,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                ),
                Container(
                  width: 250,
                  child: TextField(
                    decoration: const InputDecoration(
                        hintText: "Nom",
                        icon: Icon(Icons.account_circle)
                    ),
                    controller: nomC,
                    keyboardType:
                    TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                Container(
                  width: 250,
                  child: TextField(
                    decoration: const InputDecoration(
                        hintText: "E-mail",
                        icon: Icon(Icons.email)
                    ),
                    controller: emailC,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                ),
                Container(
                  width: 250,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Mot De Passe",
                        icon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: this._showPassword ? Colors.deepOrange : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() => this._showPassword = !this._showPassword);
                          },
                        ),
                    ),
                    controller: passwordC,
                    obscureText: !this._showPassword,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                ),
                Container(
                  width: 250,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Vérifier Mot De Passe",
                      icon: Icon(Icons.lock),
                    ),
                    controller: passwordVerC,
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                ),
                Container(
                  width: 280,
                  child: ListTile(
                    leading: Icon(Icons.accessibility),
                    title: DropdownButton(
                        isExpanded: true,
                        items: _sexes
                            .map((String sexeStringItem) {
                          return DropdownMenuItem<String>(
                            value: sexeStringItem,
                            child: Text(sexeStringItem),
                          );
                        }).toList(),
                        value: _sexSelected,
                        hint: Text('Sélectionner sexe'),
                        onChanged: (valueSelectedByUser) {
                          setState(() {
                            _sexSelected = valueSelectedByUser;
                          });
                        }),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                Container(
                  width: 250,
                  child: TextField(
                    decoration: const InputDecoration(
                        hintText: "Âge",
                        icon: Icon(Icons.tag_faces)
                    ),
                    controller: ageC,
                    keyboardType:
                    TextInputType.number,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                Container(
                  width: 250,
                  child: TextField(
                    decoration: const InputDecoration(
                        hintText: "Poids",
                        icon: Icon(Icons.line_weight)
                    ),
                    controller: weightC,
                    keyboardType:
                    TextInputType.number,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                Container(
                  width: 250,
                  child: TextField(
                    decoration: const InputDecoration(
                        hintText: "Taille",
                        icon: Icon(Icons.arrow_upward)
                    ),
                    controller: heightC,
                    keyboardType:
                    TextInputType.number,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                Container(
                  width: 280,
                  child: ListTile(
                    leading: Icon(Icons.check_box),
                    title: DropdownButton(
                        isExpanded: true,
                        items: ['Prendre du poids', 'Maintenir le poids', 'Perdre du poids'].map((String activityStringItem) {
                          return DropdownMenuItem<String>(
                            value: activityStringItem,
                            child: Text(activityStringItem),
                          );
                        }).toList(),
                        value: _goalSelected,
                        hint: Text('Sélectionner Objectif'),
                        onChanged: (String valueSelectedByUser) {
                          setState(() {
                            _goalSelected = valueSelectedByUser;
                          });
                        }),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                Container(
                  width: 280,
                  child: ListTile(
                    leading: Icon(Icons.fitness_center),
                    title: DropdownButton(
                        isExpanded: true,
                        items: _activities.map((String goalStringItem) {
                          return DropdownMenuItem<String>(
                            value: goalStringItem,
                            child: Text(goalStringItem),
                          );
                        }).toList(),
                        value: _activitySelected,
                        hint: Text('Sélectionner Niveau d\'activité'),
                        onChanged: (String valueSelectedByUser) {
                          setState(() {
                            _activitySelected = valueSelectedByUser;
                          });
                        }),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                Container(
                  width: 250,
                  child: ListTile(
                    title: Text('Accepter les termes'),
                    trailing: Checkbox(
                      value: _checkboxVal,
                      onChanged: (bool value){
                        setState(() => this._checkboxVal = value);
                      },
                      checkColor: Colors.white,
                      activeColor: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                MaterialButton(
                  onPressed: _checkboxVal ? () {
                      register();
                  }
                  : null,
                  minWidth: double.infinity,
                  height: 50,
                  child: Text(
                    'S\'inscrire'.toUpperCase(),
                  ),
                  color: Theme.of(context).buttonColor ,
                  textColor: Colors.white,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignIn(),
                      ),
                    );
                  },
                  minWidth: double.infinity,
                  height: 50,
                  textColor: Theme.of(context).buttonColor,
                  child: Text(
                    'Se connecter'.toUpperCase(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
