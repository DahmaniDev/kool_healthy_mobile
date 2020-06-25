import 'package:koolhealthymobile/pages/MenuPoulet.dart';

import '../appbar.dart';
import 'package:flutter/material.dart';
import '../drawer.dart';
import 'package:pie_chart/pie_chart.dart';

class CalculateMyNeeds extends StatefulWidget {
  final bool connected;

  const CalculateMyNeeds({
    Key key,
    @required this.connected,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CalculateMyNeedsState();
  }
}
bool _connected = false;
Map<String, double> needs = new Map();
List<Needs> needsTab = <Needs>[];
double _calories = 250;
double _protein = 150;
double _fats = 50;
double _carbohydrates = 100;



class CalculateMyNeedsState extends State<CalculateMyNeeds> {
  List<Color> colorList = [
    Color(0XFF8B281F),
    Color(0XFF9BA747),
    Color(0XFFF29D4B),
    Color(0XFFD57030),
  ];

  @override
  void initState() {
    super.initState();
    needs.putIfAbsent("Calories", () => _calories);
    needs.putIfAbsent("Protein", () => _protein);
    needs.putIfAbsent("Fats", () => _fats);
    needs.putIfAbsent("Carbs", () => _carbohydrates);
    needsTab = _calculateMyNeeds("Male", 72.0, 183.0, 23, "Active", "Bulk");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar(context,widget.connected),
        drawer: drawer(context, widget.connected),
        body: _connected
        ?SingleChildScrollView(
          child: Container(
            child: Text(
              'Sign in and fill your informations in order to calculate your nutrition\'s needs'
            ),
          ),
        )
        :SingleChildScrollView(
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
                      top: 10, right: MediaQuery.of(context).size.width * 0.6),
                  child: Text(
                    "You need : ",
                    style: TextStyle(
                        color: Colors.black87,
                        fontFamily: "Bebas",
                        fontWeight: FontWeight.bold,
                        fontSize: 26),
                  ),
                ),
                //SHOW NEEDS
                Container(
                  width: 300,
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
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: FittedBox(
                                  child: Text('${needsTab[index].amount} g'),
                                ),
                              )),
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
                      bottom: 10.0,
                      left: MediaQuery.of(context).size.width * 0.45),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.of(context).push((MaterialPageRoute(
                          builder: (context) => MenuPoulet(connected: widget.connected,)
                      )));
                    },
                    minWidth: 70.0,
                    height: 50,
                    child: Text(
                      'Prepare My Meal'.toUpperCase(),
                    ),
                    color: Colors.deepPurple,
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
    if(sexe == "Male"){
      bmr = 10 * weight + 6.25 * height - 5 * age + 5;
    }
    if(sexe == "Female"){
      bmr = 10 * weight + 6.25 * height - 5 * age - 161;
    }
    switch(activityLevel){
      case "Non Active" : resultBMR = 1.2 * bmr;
      break;
      case "Little Active" : resultBMR = 1.4 * bmr;
      break;
      case "Active" : resultBMR = 1.6 * bmr;
      break;
      case "Super Active" : resultBMR = 1.9 * bmr;
      break;
    }
    resultProtein = (weight * 2);
    switch(goal){
      case "Lose Weight" : resultFats = 0.7 * weight; resultCalories = resultBMR - 0.15 * resultBMR; resultCar = ((resultProtein * 4) + (resultFats * 9) - resultCalories)/4;
      break;
      case "Maintain Weight" : resultFats = 0.7 * weight; resultCalories = resultBMR; resultCar = ((resultProtein * 4) + (resultFats * 9) - resultCalories);
      break;
      case "Bulk" : resultFats = 0.7 * weight; resultCalories = resultBMR + 0.15 * resultBMR; resultCar = ((resultProtein * 4) + (resultFats * 9) - resultCalories)*4;
      break;
    }


    Needs cal = new Needs(type: "Calories", amount: resultCalories);
    Needs pro = new Needs(type: "Protein", amount: resultProtein);
    Needs fat = new Needs(type: "Fats", amount: resultFats);
    Needs car = new Needs(type: "Carbs", amount: resultCar);
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
