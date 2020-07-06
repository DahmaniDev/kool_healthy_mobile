import 'dart:convert';
import 'package:koolhealthymobile/models/Traiteur.dart';
import 'package:koolhealthymobile/models/User.dart';
import 'package:koolhealthymobile/pages/HomeTraiteur.dart';
import 'package:koolhealthymobile/pages/Register.dart';
import 'package:http/http.dart' as http;
import 'Home.dart';
import 'package:flutter/material.dart';



class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  TextEditingController emailC = new TextEditingController();
  TextEditingController passwordC = new TextEditingController();

  bool error = false;
  bool _switchVal = false;
  Color _bgColor = Color(0xFFD9DCD8);
  var login ='E-mail';

  Future<List> _loginUser() async{
    final response = await http.post("http://10.0.2.2/projetpfe/loginUser.php", body: {
      "username" : emailC.text,
      "password" : passwordC.text,
    });
    var dataUser = json.decode(response.body);
    if(dataUser.length == 0){
      setState(() {
        error=true;
      });
    }else{
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home(
            connected: true,
            user: new User(int.parse(dataUser[0]['id']),dataUser[0]['nom'],dataUser[0]['username'],dataUser[0]['password'],dataUser[0]['sexe'],int.parse(dataUser[0]['age']),int.parse(dataUser[0]['height']),int.parse(dataUser[0]['weight']),dataUser[0]['goal'],dataUser[0]['activity_level'])),
        ),
      );
    }

    return dataUser;
  }

  Future<List> _loginTraiteur() async{
    final response = await http.post("http://10.0.2.2/projetpfe/loginTraiteur.php", body: {
      "login" : emailC.text,
      "password" : passwordC.text,
    });
    var dataTraiteur = json.decode(response.body);
    if(dataTraiteur.length == 0){
      setState(() {
        error=true;
      });
    }else{
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeTraiteur(
            traiteur: new Traiteur(int.parse(dataTraiteur[0]['id']), dataTraiteur[0]['nom'], dataTraiteur[0]['email'], dataTraiteur[0]['telephone'], dataTraiteur[0]['login'], dataTraiteur[0]['password']),
          )
        ),
      );
      print(dataTraiteur);
    }

    return dataTraiteur;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 20.0),
          child: Center(
            child: Column(
              children: <Widget>[
                _switchVal
                ? Container()
                : Padding(
                  padding: EdgeInsets.only(top: 79),
                ),
                _switchVal
                ? Image.asset(
                  'assets/img/delivery.png',
                  width: 300,
                )
                : Image.asset(
                  'assets/img/logo.png',
                  width: 300,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                ),
                Container(
                  width: 250,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: login,
                      icon: Icon(Icons.person),
                    ),
                    controller: emailC,
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
                      hintText: "Mot de passe",
                      icon: Icon(Icons.lock),
                    ),
                    controller: passwordC,
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                error
                ?Text('Erreur d\'authentification', style: TextStyle(color: Colors.red, fontSize: 20.0))
                :Container(),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                MaterialButton(
                  onPressed: _switchVal
                      ? () {
                    _loginTraiteur();
                  }
                      : () {
                    _loginUser();
                  },
                  minWidth: double.infinity,
                  height: 50,
                  child: Text(
                    'Se connecter'.toUpperCase(),
                  ),
                  color: Theme.of(context).buttonColor,
                  textColor: Colors.white,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                _switchVal
                ? Container(
                  height: 50,
                )
                : MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Register(),
                      ),
                    );
                  },
                  minWidth: double.infinity,
                  height: 50,
                  textColor: Theme.of(context).buttonColor,
                  child: Text(
                    'S\'inscrire'.toUpperCase(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1, left: 150),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.restaurant, color: Theme.of(context).buttonColor,),
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                      ),
                      Text(
                        'Traiteur',
                        style: TextStyle(
                          color: Theme.of(context).buttonColor,
                          fontSize: 18.0,
                          fontFamily: 'Poppins'
                        ),
                      ),
                      Switch(
                        value: _switchVal,
                        onChanged: (bool value){
                          setState(() {
                            this._switchVal = value;
                            if(value == true){
                              this._bgColor = Color(0XFF88888C);
                              this.login= 'Login';
                            }
                            if(value==false){
                              this._bgColor = Color(0xFFD9DCD8);
                              this.login= 'E-mail';
                            }
                          });
                        },
                        activeColor: Theme.of(context).buttonColor,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


}
