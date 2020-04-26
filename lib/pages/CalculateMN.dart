import '../appbar.dart';
import 'package:flutter/material.dart';
import '../drawer.dart';
import 'package:pie_chart/pie_chart.dart';

class CalculateMyNeeds extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CalculateMyNeedsState();
  }
}

Map<String, double> needs = new Map();
double _calories = 250;
double _protein = 150;
double _fats = 50;
double _carbs = 100;


Needs cal = new Needs(type: "Calories", amount: _calories);
Needs pro = new Needs(type: "Protein", amount: _protein);
Needs fat = new Needs(type: "Fats", amount: _fats);
Needs car = new Needs(type: "Carbs", amount: _carbs);
final List<Needs> needsTab = [cal,pro,fat,car];

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
    needs.putIfAbsent("Carbs", () => _carbs);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar(context),
        drawer: drawer(context),
        body: SingleChildScrollView(
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
                    onPressed: () {},
                    minWidth: 70.0,
                    height: 50,
                    child: Text(
                      'Prepare My Meal'.toUpperCase(),
                    ),
                    color: Theme.of(context).buttonColor,
                    textColor: Colors.white,
                  ),
                )
              ],
            )));
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
