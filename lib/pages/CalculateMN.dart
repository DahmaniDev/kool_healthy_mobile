import 'package:koolhealthymobile/models/User.dart';
import '../appbar.dart';
import 'package:flutter/material.dart';
import '../drawer.dart';
import 'package:pie_chart/pie_chart.dart';

class CalculateMyNeeds extends StatefulWidget {
  final bool connected;
  final User user;

  const CalculateMyNeeds({
    Key key,
    @required this.connected,
    @required this.user,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CalculateMyNeedsState();
  }
}
Map<String, double> needs = new Map();
List<Needs> needsTab = <Needs>[];


class CalculateMyNeedsState extends State<CalculateMyNeeds> {
  List<Color> colorList = [
    Color(0XFF6975A6),
    Color(0XFFF28A30),
    Color(0XFFF05837),
  ];


  @override
  void initState() {
    super.initState();
    needsTab = _calculateMyNeeds(widget.user.sexe, widget.user.weight.toDouble(), widget.user.height.toDouble(), widget.user.age, widget.user.getActivity(), widget.user.goal);
    needs.putIfAbsent("Protéine", () => needsTab[1].amount);
    needs.putIfAbsent("Graisses", () => needsTab[2].amount);
    needs.putIfAbsent("Carbohydrates", () => needsTab[3].amount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar(context,widget.connected, widget.user),
        drawer: drawer(context, widget.connected, widget.user),
        body:SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Container(
                      child: PieChart(
                        dataMap: needs,
                        showLegends: true,
                        legendPosition: LegendPosition.right,
                        animationDuration: Duration(milliseconds: 0),
                        chartType: ChartType.disc,
                        colorList: colorList,
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.only(
                      top: 30, right: MediaQuery.of(context).size.width * 0.6, bottom: 10),
                  child: Text(
                    "Vos besoins : ",
                    style: TextStyle(
                        color: Colors.black87,
                        fontFamily: "Bebas",
                        fontWeight: FontWeight.bold,
                        fontSize: 26),
                  ),
                ),
                //SHOW NEEDS
                Container(
                  width: 350,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) {
                      return Card(
                        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 2, bottom: 2),
                        elevation: 1,
                        child: ListTile(
                          leading: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.lightGreenAccent,
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: FittedBox(
                                  child: Text('${needsTab[index].amount.toStringAsFixed(2)}', style: TextStyle(color: Colors.black),),
                                ),
                              )
                          ),
                          title: Text(
                            needsTab[index].type,
                            style: Theme.of(context).textTheme.title,
                          ),
                        ),
                      );
                    },
                    itemCount: needsTab.length,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 20.0,
                      bottom: 30.0,
                      left: MediaQuery.of(context).size.width * 0.45),
                  child: MaterialButton(
                    onPressed: () {},
                    minWidth: 70.0,
                    height: 50,
                    child: Text(
                      'Préparer Mon repas'.toUpperCase(),
                    ),
                    color: Theme.of(context).buttonColor,
                    textColor: Colors.white,
                  ),
                )
              ],
            )));
  }

  List<Needs> _calculateMyNeeds(String sexe, double weight, double height, int age, String activityLevel, String goal){
    double bmr;
    double resultBMR;
    double resultCalories;
    double resultProtein;
    double resultFats;
    double resultCar;
    if(sexe == "Homme"){
      bmr = 10 * weight + 6.25 * height - 5 * age + 5;
    }
    if(sexe == "Femme"){
      bmr = 10 * weight + 6.25 * height - 5 * age - 161;
    }
    switch(activityLevel){
      case "Pas actif" : resultBMR = 1.2 * bmr;
      break;
      case "Peu actif" : resultBMR = 1.4 * bmr;
      break;
      case "Actif" : resultBMR = 1.6 * bmr;
      break;
      case "Super Actif" : resultBMR = 1.9 * bmr;
      break;
    }
    switch(goal){
      case "Prendre du poids" :
        resultCalories = resultBMR + (0.15 * resultBMR);
        resultFats= (0.3 * resultCalories)/9 ;
        resultProtein=(resultCalories * 0.3)/4;
        resultCar = (resultCalories * 0.4)/4;
        break;
      case "Maintenir le poids" :
        resultCalories = resultBMR;
        resultFats= (0.2 * resultCalories)/9 ;
        resultProtein=(resultCalories * 0.4)/4;
        resultCar = (resultCalories * 0.4)/4;
        break;
      case "Perdre du poids" :
        resultCalories = resultBMR - (0.15 * resultBMR);
        resultFats= (0.2 * resultCalories)/9 ;
        resultProtein=(resultCalories * 0.45)/4;
        resultCar = (resultCalories * 0.35)/4;
        break;
    }


    Needs cal = new Needs(type: "Calories (Kcal)", amount: resultCalories);
    Needs pro = new Needs(type: "Protéine (g)", amount: resultProtein);
    Needs fat = new Needs(type: "Graisses (g)", amount: resultFats);
    Needs car = new Needs(type: "Carbohydrates (Kcal)", amount: resultCar);
    final List<Needs> needsCalculated = [cal,pro,fat,car];
    return needsCalculated;
  }

}

class Needs {
  final String type;
  final double amount;

  Needs({
    @required this.type,
    @required this.amount,
  });
}
