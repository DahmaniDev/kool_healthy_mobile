class Traiteur{
  int _id;
  String _nom;
  String _email;
  String _telephone;
  String _login;
  String _password;

  Traiteur(this._id,this._nom, this._email, this._telephone, this._login, this._password);

  int get id => _id;
  String get nom => _nom;
  String get email => _email;
  String get telephone => _telephone;
  String get login => _login;
  String get password => _password;

}