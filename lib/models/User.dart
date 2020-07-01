

class User{
  int _id;
  String _nom;
  String _username;
  String _password;
  String _sexe;
  int _age;
  int _height;
  int _weight;
  String _goal;
  // ignore: non_constant_identifier_names
  String _activity_level;

  User(this._id,this._nom, this._username, this._password, this._sexe, this._age, this._height, this._weight, this._goal, this._activity_level);

  int get id => _id;
  String get nom => _nom;
  String get username => _username;
  String get password => _password;
  String get sexe => _sexe;
  int get age => _age;
  int get height => _height;
  int get weight => _weight;
  String get goal => _goal;
  // ignore: non_constant_identifier_names
  String get activity_level => _activity_level;

  String getActivity(){
    return this.activity_level;
  }
}