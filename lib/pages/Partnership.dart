import '../appbar.dart';
import 'package:flutter/material.dart';
import '../drawer.dart';

class Partnership extends StatefulWidget {
  final bool connected;

  const Partnership({
    Key key,
    @required this.connected,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PartnershipState();
  }
}

class PartnershipState extends State<Partnership>{

  int _radioValue = -1;
  TextEditingController emailC = new TextEditingController();
  TextEditingController nomC = new TextEditingController();

  void handleRadioChange(int value){
    setState(() {
      _radioValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, widget.connected),
      drawer: drawer(context, widget.connected),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 15.0),
                child: Text(
                  'Devenir un partenaire',
                  style: TextStyle(
                    fontFamily: 'Bebas',
                    fontSize: 35,
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 10),
              ),
              Container(
                width: 250,
                height: 80,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: 'E-mail'),
                  controller: emailC,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, bottom: 5),
              ),
              Container(
                height: 80,
                width: 250,
                child: TextField(
                    decoration: InputDecoration(labelText: 'Nom du restaurant'),
                    controller: nomC,
                ),
              ),
              Text(
                'Vous êtes :',
                style: TextStyle(
                  fontFamily: 'poppins',
                  fontSize: 15,
                ),
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: 0,
                    groupValue: _radioValue,
                    onChanged: handleRadioChange,
                  ),
                  Text(
                      'Restaurant'
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: 1,
                    groupValue: _radioValue,
                    onChanged: handleRadioChange,
                  ),
                  Text(
                      'Traiteur'
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: 10.0,
                    left: MediaQuery.of(context).size.width * 0.55),
                child: MaterialButton(
                  onPressed: () {},
                  minWidth: 70.0,
                  height: 50,
                  child: Text(
                    'Envoyer'.toUpperCase(),
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

  String returnTerms(){
    String terms;
    terms = 'Terms and Conditions\n\nWelcome to Kool Healthy!\nThese terms and conditions outline the rules and regulations for the use of Kool Healthy\'s Website, located at www.koolhealthy.tn.\nBy accessing this website we assume you accept these terms and conditions. Do not continue to use Kool Healthy if you do not agree to take all of the terms and conditions stated on this page.\nThe following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice and all Agreements: "Client", "You" and "Your" refers to you, the person log on this website and compliant to the Company\’s terms and conditions. "The Company", "Ourselves", "We", "Our" and "Us", refers to our Company. "Party", "Parties", or "Us", refers to both the Client and ourselves. All terms refer to the offer, acceptance and consideration of payment necessary to undertake the process of our assistance to the Client in the most appropriate manner for the express purpose of meeting the Client\’s needs in respect of provision of the Company\’s stated services, in accordance with and subject to, prevailing law of Netherlands. Any use of the above terminology or other words in the singular, plural, capitalization and/or he/she or they, are taken as interchangeable and therefore as referring to same.\nCookies\n\nWe employ the use of cookies. By accessing Kool Healthy, you agreed to use cookies in agreement with the Kool Healthy\'s Privacy Policy.\nMost interactive websites use cookies to let us retrieve the user\’s details for each visit. Cookies are used by our website to enable the functionality of certain areas to make it easier for people visiting our website. Some of our affiliate/advertising partners may also use cookies.\nLicense\n\nUnless otherwise stated, Kool Healthy and/or its licensors own the intellectual property rights for all material on Kool Healthy. All intellectual property rights are reserved. You may access this from Kool Healthy for your own personal use subjected to restrictions set in these terms and conditions.\n\nYou must not:\n\nRepublish material from Kool Healthy\nSell, rent or sub-license material from Kool Healthy\nReproduce, duplicate or copy material from Kool Healthy\nRedistribute content from Kool Healthy\nThis Agreement shall begin on the date hereof.\n\nParts of this website offer an opportunity for users to post and exchange opinions and information in certain areas of the website. Kool Healthy does not filter, edit, publish or review Comments prior to their presence on the website. Comments do not reflect the views and opinions of Kool Healthy,its agents and/or affiliates. Comments reflect the views and opinions of the person who post their views and opinions. To the extent permitted by applicable laws, Kool Healthy shall not be liable for the Comments or for any liability, damages or expenses caused and/or suffered as a result of any use of and/or posting of and/or appearance of the Comments on this website.\n\nKool Healthy reserves the right to monitor all Comments and to remove any Comments which can be considered inappropriate, offensive or causes breach of these Terms and Conditions.\n\nYou warrant and represent that:\n\nYou are entitled to post the Comments on our website and have all necessary licenses and consents to do so;\nThe Comments do not invade any intellectual property right, including without limitation copyright, patent or trademark of any third party;\nThe Comments do not contain any defamatory, libelous, offensive, indecent or otherwise unlawful material which is an invasion of privacy\nThe Comments will not be used to solicit or promote business or custom or present commercial activities or unlawful activity.\nYou hereby grant Kool Healthy a non-exclusive license to use, reproduce, edit and authorize others to use, reproduce and edit any of your Comments in any and all forms, formats or media.\n\nHyperlinking to our Content\nThe following organizations may link to our Website without prior written approval:\n\nGovernment agencies;\nSearch engines;\nNews organizations;\nOnline directory distributors may link to our Website in the same manner as they hyperlink to the Websites of other listed businesses; and\nSystem wide Accredited Businesses except soliciting non-profit organizations, charity shopping malls, and charity fundraising groups which may not hyperlink to our Web site.\nThese organizations may link to our home page, to publications or to other Website information so long as the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products and/or services; and (c) fits within the context of the linking party\’s site.\nWe may consider and approve other link requests from the following types of organizations:\n\ncommonly-known consumer and/or business information sources;\ndot.com community sites;\nassociations or other groups representing charities;\nonline directory distributors;\ninternet portals;\naccounting, law and consulting firms; and\neducational institutions and trade associations.\nWe will approve link requests from these organizations if we decide that: (a) the link would not make us look unfavorably to ourselves or to our accredited businesses; (b) the organization does not have any negative records with us; (c) the benefit to us from the visibility of the hyperlink compensates the absence of Kool Healthy; and (d) the link is in the context of general resource information.\n\nThese organizations may link to our home page so long as the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products or services; and (c) fits within the context of the linking party’s site.\n\nIf you are one of the organizations listed in paragraph 2 above and are interested in linking to our website, you must inform us by sending an e-mail to Kool Healthy. Please include your name, your organization name, contact information as well as the URL of your site, a list of any URLs from which you intend to link to our Website, and a list of the URLs on our site to which you would like to link. Wait 2-3 weeks for a response.\n\nApproved organizations may hyperlink to our Website as follows:\n\nBy use of our corporate name; or\nBy use of the uniform resource locator being linked to; or\nBy use of any other description of our Website being linked to that makes sense within the context and format of content on the linking party\’s site.\nNo use of Kool Healthy\'s logo or other artwork will be allowed for linking absent a trademark license agreement.\n\niFrames\nWithout prior approval and written permission, you may not create frames around our Webpages that alter in any way the visual presentation or appearance of our Website.\n\nContent Liability\nWe shall not be hold responsible for any content that appears on your Website. You agree to protect and defend us against all claims that is rising on your Website. No link(s) should appear on any Website that may be interpreted as libelous, obscene or criminal, or which infringes, otherwise violates, or advocates the infringement or other violation of, any third party rights.\n\nYour Privacy\nPlease read Privacy Policy\n\nReservation of Rights\nWe reserve the right to request that you remove all links or any particular link to our Website. You approve to immediately remove all links to our Website upon request. We also reserve the right to amen these terms and conditions and it\’s linking policy at any time. By continuously linking to our Website, you agree to be bound to and follow these linking terms and conditions.\n\nRemoval of links from our website\nIf you find any link on our Website that is offensive for any reason, you are free to contact and inform us any moment. We will consider requests to remove links but we are not obligated to or so or to respond to you directly.\n\nWe do not ensure that the information on this website is correct, we do not warrant its completeness or accuracy; nor do we promise to ensure that the website remains available or that the material on the website is kept up to date.\n\nDisclaimer\nTo the maximum extent permitted by applicable law, we exclude all representations, warranties and conditions relating to our website and the use of this website. Nothing in this disclaimer will:\n\nlimit or exclude our or your liability for death or personal injury;\nlimit or exclude our or your liability for fraud or fraudulent misrepresentation;\nlimit any of our or your liabilities in any way that is not permitted under applicable law; or\nexclude any of our or your liabilities that may not be excluded under applicable law.\nThe limitations and prohibitions of liability set in this Section and elsewhere in this disclaimer: (a) are subject to the preceding paragraph; and (b) govern all liabilities arising under the disclaimer, including liabilities arising in contract, in tort and for breach of statutory duty.\n\nAs long as the website and the information and services on the website are provided free of charge, we will not be liable for any loss or damage of any nature.';
    return terms;
  }


}
