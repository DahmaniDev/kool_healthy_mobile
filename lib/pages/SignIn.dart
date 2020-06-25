import 'Home.dart';
import 'package:flutter/material.dart';



class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  TextEditingController emailC = new TextEditingController();
  TextEditingController passwordC = new TextEditingController();

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
                      hintText: "E-mail",
                      icon: Icon(Icons.person)
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
                      icon: Icon(Icons.lock)
                    ),
                    controller: passwordC,
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                ),
                MaterialButton(
                  onPressed: () {
                    if(_authentification(emailC.text, passwordC.text)==true){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(connected: true),
                        ),
                      );
                    }
                    else{
                      print('Erreur d\'authentification');
                    }
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
                MaterialButton(
                  onPressed: () {},
                  minWidth: double.infinity,
                  height: 50,
                  textColor: Theme.of(context).buttonColor,
                  child: Text(
                    'S\'inscrire'.toUpperCase(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _authentification(String email, String password){
    if(email=='dahmanidev'){
      if(password=='akalee1997'){
        return true;
      }
    }
    return false;
  }
}
