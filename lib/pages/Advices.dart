import '../appbar.dart';
import 'package:flutter/material.dart';
import '../drawer.dart';
import '../ArticleInt.dart';

class Advices extends StatefulWidget {
  @override
  _AdvicesState createState() => _AdvicesState();
}

class _AdvicesState extends State<Advices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: myAppBar(context),
      drawer: drawer(context),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.fromLTRB(25, 30, 25, 25),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                Text(
                  'News',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 28,
                    fontFamily: 'Bebas',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 250,
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: ListView(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      ArticleCard(
                        title: 'Lose 5kg in JUST 2 weeks !',
                        description: '* Eat lots of green vegetables or a fibre supplement. Fibre helps reduce \"bat wings\" and \"bingo arms\" by eliminating toxins.\n* Limit alcohol to four standard drinks a week. A 400kJ glass of wine replaces one snack.\n* Your body converts wheat to sugar faster than any other grain. So try and avoid bread and pasta, if you can.\n* All breakfasts on the diet can be swapped with other breakfasts, lunches with lunches and dinners with dinners.\n* One coffee per day is allowed. After that, drink green tea.\n* All breakfasts on the four week diet are interchangeable with other breakfasts, lunches with lunches and dinners with dinners.',
                      ),
                      ArticleCard(
                        title: 'HOW TO BULK !',
                        description: '1. Count your calories (an additional 2,270 to 3,630 calories a week).\n2. Power up with protein (0.36 grams of protein per pound of body weight).\n3. Don\'t nix carbohydrates. \n4. Weigh the benefits of cardio.\n5. Tailor your workouts for muscle mass.',
                      ),
                      ArticleCard(
                        title: 'Healthy Meals for Women',
                        description: '',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                Text(
                  'quotes',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 28,
                    fontFamily: 'Bebas',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 250,
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: ListView(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      ArticleCard(
                        title: 'Monday Motivations',
                        description: 'Moooooooondaaaaaaaaaay',
                      ),
                      ArticleCard(
                        title: 'WAKE UP !',
                        description: 'looooooooooooool',
                      ),
                      ArticleCard(
                        title: 'Be Better !',
                        description: 'Noooooooooooooooooooooooo',
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}

class ArticleCard extends StatelessWidget {
  final String title;
  final String description;

  const ArticleCard({
    Key key,
    @required this.title,
    @required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,  MaterialPageRoute(builder: (context){
          return ArticleInt(
            title: title,
            description: description,
          );
        }));
      },
      child: Container(
        width: 250,
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.green,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 60),
            ),
            RichText(
              text: TextSpan(
                text: title,
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).accentColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
