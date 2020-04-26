import '../appbar.dart';
import 'package:flutter/material.dart';
import '../drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ContactUsState();
  }
}

class ContactUsState extends State<ContactUs>{

  final descriptionController = TextEditingController();

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      drawer: drawer(context),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 15.0),
                child: Text(
                  'Get in Touch',
                  style: TextStyle(
                    fontFamily: 'Bebas',
                    fontSize: 45,
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
              Text(
                'Feel free to tell us anything',
                style: TextStyle(
                  fontFamily: 'poppins',
                  fontSize: 15,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
              ),
              Container(
                height: 200,
                width: 250,
                child: TextField(
                  maxLines: 4,
                  maxLength: 2500,
                  decoration: InputDecoration(labelText: 'Description'),
                  controller: descriptionController,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: 10.0,
                    left: MediaQuery.of(context).size.width * 0.55),
                child: MaterialButton(
                  onPressed: () {
                    _sendEmail('kool.healthy.contact@gmail.com', 'Contact Message ${DateTime.now()}', '${descriptionController.text}');
                  },
                  minWidth: 70.0,
                  height: 50,
                  child: Text(
                    'Submit'.toUpperCase(),
                  ),
                  color: Theme.of(context).buttonColor,
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _sendEmail(String toMailId, String subject, String body) async{
    var url = 'mailto:$toMailId?subject=$subject&body=$body';
    AlertDialog alertDialog = AlertDialog(
      title: Text('EmailSender'),
      content: Text('Check your E-mail'),
    );
    if (await canLaunch(url)) {
      await launch(url);
      showDialog(
          context: context,
          builder: (_) => alertDialog
      );
    } else {
      throw 'Could not launch $url';
    }
  }

}
