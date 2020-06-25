import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:numberpicker/numberpicker.dart';

import 'Home.dart';

class ProfilePage extends StatefulWidget {
  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();
  static var _activities = ['Pas Actif', 'Peu Actif', 'Actif', 'Super Actif'];
  String _activitySelected = _activities[0];
  static var _sexes = ['Homme', 'Femme'];
  String _sexSelected = _sexes[0];
  int _currentAge = 10;
  TextEditingController nameC = new TextEditingController();
  TextEditingController emailC = new TextEditingController();
  TextEditingController ageC = new TextEditingController();
  TextEditingController heightC = new TextEditingController();
  TextEditingController weightC = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
      color: Colors.white,
      child: new ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              new Container(
                height: 250.0,
                color: Colors.white,
                child: new Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left: 20.0, top: 20.0),
                        child: new Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            GestureDetector(
                              child: Container(
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Theme.of(context).buttonColor,
                                  size: 22.0,
                                ),
                              ),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0,
                                  right:
                                      MediaQuery.of(context).size.width * 0.48),
                              child: new Text('PROFIL',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                      fontFamily: 'sans-serif-light',
                                      color: Theme.of(context).buttonColor)),
                            ),
                            new Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                _status ? _getEditIcon() : new Container(),
                              ],
                            )
                          ],
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: new Stack(fit: StackFit.loose, children: <Widget>[
                        new Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Container(
                                width: 140.0,
                                height: 140.0,
                                decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                    image: new ExactAssetImage(
                                        'assets/img/as.png'),
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          ],
                        ),
                      ]),
                    )
                  ],
                ),
              ),
              new Container(
                color: Color(0xffFFFFFF),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 25.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Vos données personnelles',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        color: Theme.of(context).buttonColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Nom',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: _status
                                    ? Text(nameC.text,
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color:
                                                Theme.of(context).buttonColor,
                                            fontWeight: FontWeight.bold))
                                    : new TextField(
                                        decoration: const InputDecoration(
                                          hintText: "Entrer votre nom",
                                        ),
                                        enabled: !_status,
                                        autofocus: !_status,
                                        controller: nameC,
                                      ),
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Email',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: _status
                                    ? Text(emailC.text,
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color:
                                                Theme.of(context).buttonColor,
                                            fontWeight: FontWeight.bold))
                                    : new TextField(
                                        decoration: const InputDecoration(
                                            hintText: "Entrer votre Email"),
                                        enabled: !_status,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        controller: emailC,
                                      ),
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Niveau d\'activité',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                  child: _status
                                      ? Text(_activitySelected,
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color:
                                                  Theme.of(context).buttonColor,
                                              fontWeight: FontWeight.bold))
                                      : DropdownButton(
                                          items: _activities
                                              .map((String activityStringItem) {
                                            return DropdownMenuItem<String>(
                                              value: activityStringItem,
                                              child: Text(activityStringItem),
                                            );
                                          }).toList(),
                                          value: _activitySelected,
                                          isExpanded: true,
                                          onChanged: (valueSelectedByUser) {
                                            setState(() {
                                              _activitySelected =
                                                  valueSelectedByUser;
                                            });
                                          })),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  child: new Text(
                                    'Sexe',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                flex: 2,
                              ),
                              Expanded(
                                child: Container(
                                  child: new Text(
                                    'Âge',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                flex: 2,
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 130,
                                child: _status
                                    ? Text(_sexSelected,
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color:
                                                Theme.of(context).buttonColor,
                                            fontWeight: FontWeight.bold))
                                    : DropdownButton(
                                        isExpanded: true,
                                        items: _sexes
                                            .map((String activityStringItem) {
                                          return DropdownMenuItem<String>(
                                            value: activityStringItem,
                                            child: Text(activityStringItem),
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
                              Padding(
                                padding: EdgeInsets.only(left: 20.0),
                              ),
                              Flexible(
                                child: _status
                                    ? Text(ageC.text,
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color:
                                                Theme.of(context).buttonColor,
                                            fontWeight: FontWeight.bold))
                                    : new TextField(
                                        keyboardType: TextInputType.number,
                                        controller: ageC,
                                        decoration: const InputDecoration(
                                            hintText: "Entrer votre âge"),
                                        enabled: !_status,
                                        onTap: _showDialog,
                                      ),
                                flex: 2,
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  child: new Text(
                                    'Taille',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                flex: 2,
                              ),
                              Expanded(
                                child: Container(
                                  child: new Text(
                                    'Poids',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                flex: 2,
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: _status
                                      ? Text(heightC.text,
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color:
                                                  Theme.of(context).buttonColor,
                                              fontWeight: FontWeight.bold))
                                      : TextField(
                                          keyboardType: TextInputType.number,
                                          decoration: const InputDecoration(
                                              hintText: "Taille en cm"),
                                          enabled: !_status,
                                          controller: heightC,
                                        ),
                                ),
                                flex: 2,
                              ),
                              Flexible(
                                child: _status
                                    ? Text(weightC.text,
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color:
                                                Theme.of(context).buttonColor,
                                            fontWeight: FontWeight.bold))
                                    : TextField(
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                            hintText: "Poids en kg"),
                                        enabled: !_status,
                                        controller: weightC,
                                      ),
                                flex: 2,
                              ),
                            ],
                          )),
                      !_status ? _getActionButtons() : _getSetButtons(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Enregistrer"),
                textColor: Colors.white,
                color: Colors.green,
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Annuler"),
                textColor: Colors.white,
                color: Colors.red,
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getSetButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new RaisedButton(
                    child: new Text("Commandes"),
                    elevation: 11.0,
                    textColor: Colors.white,
                    color: Theme.of(context).buttonColor,
                    onPressed: () {},
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                    child: new Text("Déconnecter"),
                    textColor: Colors.white,
                    elevation: 11.0,
                    color: Theme.of(context).buttonColor,
                    onPressed: () {
                      _logout();
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Theme.of(context).buttonColor,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }

  void _showDialog() {
    showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return new NumberPickerDialog.integer(
            minValue: 15,
            maxValue: 60,
            title: new Text("Sélectionner votre Âge"),
            initialIntegerValue: _currentAge,
          );
        }).then((int value) {
      if (value != null) {
        setState(() => _currentAge = value);
        ageC.text = _currentAge.toString();
      }
    });
  }

  Future<ByteData> _logout() async{
    await Future.delayed(Duration(seconds: 2));
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Home(connected: false),
      ),
    );
  }
}
