import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:koolhealthymobile/pages/MesCommandes.dart';
import '../models/User.dart';
import 'package:numberpicker/numberpicker.dart';

import 'Home.dart';

class ProfilePage extends StatefulWidget {
  final User user;

  const ProfilePage({
    Key key,
    @required this.user,
  }) : super(key: key);

  @override
  ProfilePageState createState() => ProfilePageState(this.user);
}

class ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  User user;
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();
  static var _activities = ['Pas Actif', 'Peu Actif', 'Actif', 'Super Actif'];

  static var _sexes = ['Homme', 'Femme'];

  TextEditingController nameC = new TextEditingController();
  TextEditingController emailC = new TextEditingController();
  TextEditingController ageC = new TextEditingController();
  TextEditingController heightC = new TextEditingController();
  TextEditingController weightC = new TextEditingController();

  ProfilePageState(this.user);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String _activitySelected = user.getActivity();
    String _sexSelected = _sexes[0];
    int _currentAge = 10;
    String _goalSelected = user.goal;

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
                                      color: Theme
                                          .of(context)
                                          .buttonColor,
                                      size: 22.0,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => Home(user: widget.user, connected: true)
                                    ));
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0,
                                      right:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.48),
                                  child: new Text('Home',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                          fontFamily: 'sans-serif-light',
                                          color: Theme
                                              .of(context)
                                              .buttonColor)),
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
                          child: new Stack(
                              fit: StackFit.loose, children: <Widget>[
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
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
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
                                            color: Theme
                                                .of(context)
                                                .buttonColor,
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
                                        ? Text(
                                        widget.user.nom ?? 'default value',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color:
                                            Theme
                                                .of(context)
                                                .buttonColor,
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
                                        ? Text(
                                        widget.user.username ?? 'default value',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color:
                                            Theme
                                                .of(context)
                                                .buttonColor,
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
                                          ? Text(
                                          widget.user.activity_level ??
                                              'default value',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color:
                                              Theme
                                                  .of(context)
                                                  .buttonColor,
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
                                        ? Text(
                                        widget.user.sexe ?? 'default value',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color:
                                            Theme
                                                .of(context)
                                                .buttonColor,
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
                                    padding: EdgeInsets.only(left: 50.0),
                                  ),
                                  Flexible(
                                    child: _status
                                        ? Text(
                                        '${widget.user.age}' ?? 'default value',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color:
                                            Theme
                                                .of(context)
                                                .buttonColor,
                                            fontWeight: FontWeight.bold))
                                        : new TextField(
                                      keyboardType: TextInputType.number,
                                      controller: ageC,
                                      decoration: const InputDecoration(
                                          hintText: "Entrer votre âge"),
                                      enabled: !_status,
                                      onTap: () => _showDialog(_currentAge),
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
                                    child: _status
                                        ? Padding(
                                        padding: EdgeInsets.only(right: 10.0),
                                        child: Text(
                                            '${widget.user.height}' ??
                                                'default value',
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Theme
                                                    .of(context)
                                                    .buttonColor,
                                                fontWeight: FontWeight.bold)))
                                        : Container(
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                            hintText: "Taille en cm"),
                                        enabled: !_status,
                                        controller: heightC,
                                      ),
                                      width: 170,
                                    ),
                                    flex: 2,
                                  ),
                                  Flexible(
                                    child: _status
                                        ? Padding(
                                        padding:
                                        const EdgeInsets.only(left: 150.0),
                                        child: Text(
                                            '${widget.user.weight}' ??
                                                'default value',
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Theme
                                                    .of(context)
                                                    .buttonColor,
                                                fontWeight: FontWeight.bold)))
                                        : Padding(
                                      padding:
                                      const EdgeInsets.only(left: 10.0),
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                            hintText: "Poids en kg"),
                                        enabled: !_status,
                                        controller: weightC,
                                      ),
                                    ),
                                    flex: 2,
                                  )
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
                                        'Objectif',
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
                                          ? Text(
                                          widget.user.goal ?? 'default value',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color:
                                              Theme
                                                  .of(context)
                                                  .buttonColor,
                                              fontWeight: FontWeight.bold))
                                          : DropdownButton(
                                          items: [
                                            'Prendre du poids',
                                            'Maintenir le poids',
                                            'Perdre du poids'
                                          ].map((String goalStringItem) {
                                            return DropdownMenuItem<String>(
                                              value: goalStringItem,
                                              child: Text(goalStringItem),
                                            );
                                          }).toList(),
                                          value: _goalSelected,
                                          isExpanded: true,
                                          onChanged: (valueSelectedByUser) {
                                            setState(() {
                                              _goalSelected =
                                                  valueSelectedByUser;
                                            });
                                          })),
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
                    color: Theme
                        .of(context)
                        .buttonColor,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) => MesCommandesPage(user: widget.user),
                      ));
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
                    child: new Text("Déconnecter"),
                    textColor: Colors.white,
                    elevation: 11.0,
                    color: Theme
                        .of(context)
                        .buttonColor,
                    onPressed: () {
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text('Déconnexion'),
                            content: Text(
                              'Vous êtes sûr ?'
                            ),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('Annuler'),
                                onPressed: () => Navigator.pop(context),
                              ),
                              FlatButton(
                                child: Text('OK'),
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Home(
                                            connected: false,
                                            user: null
                                        )
                                    )
                                ),
                              )
                            ],
                          )
                      );
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
        backgroundColor: Theme
            .of(context)
            .buttonColor,
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

  void _showDialog(int age) {
    showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return new NumberPickerDialog.integer(
            minValue: 15,
            maxValue: 60,
            title: new Text("Sélectionner votre Âge"),
            initialIntegerValue: age,
          );
        }).then((int value) {
      if (value != null) {
        setState(() => age = value);
        ageC.text = age.toString();
      }
    });
  }


}
