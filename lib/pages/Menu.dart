import '../appbar.dart';
import 'package:flutter/material.dart';

import '../drawer.dart';




class Menu extends StatelessWidget {

  final int proteinValue;
  final int caloriesValue;
  final int fatsValue;
  final int carbohydratesValue;

  const Menu({
    Key key,
    @required this.proteinValue,
    @required this.caloriesValue,
    @required this.fatsValue,
    @required this.carbohydratesValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      drawer: drawer(context),
    );
  }
}
