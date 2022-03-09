import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:plant_disease_detection/main.dart';
import 'package:plant_disease_detection/utilities/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  String txt = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => MyHomePage(
                  ),
                ),
              );
            },
            child: Icon(Icons.arrow_back)),
        title: Text('About'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InteractiveViewer(
              child: Card(
                margin: EdgeInsets.zero,
                child: FadeInImage(
                  placeholder: AssetImage('assets/wait.gif'),
                  image: AssetImage('assets/saeed.jpeg'),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  SizedBox(height: 15.0),
                  Align(
                    heightFactor: 1.5,
                    alignment: Alignment.topLeft,
                    child: Text('Saeed-Ullah', style: kTitleText),
                  ),
                  Align(
                    heightFactor: 1.0,
                    alignment: Alignment.topLeft,
                    child: Text(
                        'Trainer, Consultant and passionated Flutter Developer',
                        style: kMyIntro),
                  ),
                  Divider(
                    endIndent: 240.0,
                    thickness: 5.0,
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    'A passionate Software Engineer for more than six years in '
                    'different industries. He worked as a consultant for multiple'
                    'enterprise companies in Europe such as Swisscom, Diligent and '
                    'Deutsche Telekom. In 2020 he founded Flutter Explained a Tutorial '
                    'Channel on YouTube where he explains everything around Flutter Development.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SignInButton(
                        Buttons.Email,
                        padding: EdgeInsets.all(12.0),
                        elevation: 14.0,
                        mini: true,
                        onPressed: () {
                          launch('https://mail.google.com/mail/u/0/#inbox');
                        },
                      ),
                      SizedBox(
                        width: 48.0,
                      ),
                      SignInButton(
                        Buttons.LinkedIn,
                        padding: EdgeInsets.all(12.0),
                        elevation: 14.0,
                        mini: true,
                        onPressed: () {
                          launch('https://www.linkedin.com/login');
                        },
                      ),
                      SizedBox(
                        width: 48.0,
                      ),
                      SignInButton(
                        Buttons.GitHub,
                        mini: true,
                        padding: EdgeInsets.all(12.0),
                        elevation: 14.0,
                        onPressed: () {
                          launch(
                              'https://github.com/asadpro?tab=repositories ');
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 33.0,
                  )
                ],
              ),
            ),

            // Another container start from here
            InteractiveViewer(
              child: Card(
                margin: EdgeInsets.zero,
                child: FadeInImage(
                  placeholder: AssetImage('assets/wait.gif'),
                  image: AssetImage('assets/salman.jpeg'),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  SizedBox(height: 15.0),
                  Align(
                    heightFactor: 1.5,
                    alignment: Alignment.topLeft,
                    child: Text('Salman-Gohar', style: kTitleText),
                  ),
                  Align(
                    heightFactor: 1.0,
                    alignment: Alignment.topLeft,
                    child: Text('Mobile Developer and application tester',
                        style: kMyIntro),
                  ),
                  Divider(
                    endIndent: 240.0,
                    thickness: 5.0,
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    'I am a Mobile App Developer and Team Leader at BlueBit Technologies, in this My core competency lies in the complete end-to-end management and completing the entire project (iOS, Android and Backend side). I am seeking opportunities'
                    ' to build Mobile Apps from the ground up for you or your business.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SignInButton(
                        Buttons.Email,
                        padding: EdgeInsets.all(12.0),
                        elevation: 14.0,
                        mini: true,
                        onPressed: () {
                          launch('https://mail.google.com/mail/u/0/#inbox');
                        },
                      ),
                      SizedBox(
                        width: 48.0,
                      ),
                      SignInButton(
                        Buttons.LinkedIn,
                        padding: EdgeInsets.all(12.0),
                        elevation: 14.0,
                        mini: true,
                        onPressed: () {
                          launch('https://www.linkedin.com/login');
                        },
                      ),
                      SizedBox(
                        width: 48.0,
                      ),
                      SignInButton(
                        Buttons.GitHub,
                        mini: true,
                        padding: EdgeInsets.all(12.0),
                        elevation: 14.0,
                        onPressed: () {
                          launch(
                              'https://github.com/asadpro?tab=repositories ');
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 33.0,
                  )
                ],
              ),
            ),

            // Another container start from here
            InteractiveViewer(
              child: Card(
                margin: EdgeInsets.zero,
                child: FadeInImage(
                  placeholder: AssetImage('assets/wait.gif'),
                  image: AssetImage('assets/ilyas.jpeg'),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  SizedBox(height: 15.0),
                  Align(
                    heightFactor: 1.5,
                    alignment: Alignment.topLeft,
                    child: Text('Muhammad Ilyas', style: kTitleText),
                  ),
                  Align(
                    heightFactor: 1.0,
                    alignment: Alignment.topLeft,
                    child: Text(
                        'Mobile Developer, Computer operator and programmer',
                        style: kMyIntro),
                  ),
                  Divider(
                    endIndent: 240.0,
                    thickness: 5.0,
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    'A passionate Software Engineer for more than six years in '
                    'different industries. He worked as a consultant for multiple'
                    'enterprise companies in Europe such as Swisscom, Diligent and '
                    'Deutsche Telekom. In 2020 he founded Flutter  Explained a Tutorial '
                    'Channel on YouTube where he explains everything around Flutter Development.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SignInButton(
                        Buttons.Email,
                        padding: EdgeInsets.all(12.0),
                        elevation: 14.0,
                        mini: true,
                        onPressed: () {
                          launch('https://mail.google.com/mail/u/0/#inbox');
                        },
                      ),
                      SizedBox(
                        width: 48.0,
                      ),
                      SignInButton(
                        Buttons.LinkedIn,
                        padding: EdgeInsets.all(12.0),
                        elevation: 14.0,
                        mini: true,
                        onPressed: () {
                          launch('https://www.linkedin.com/login');
                        },
                      ),
                      SizedBox(
                        width: 48.0,
                      ),
                      SignInButton(
                        Buttons.GitHub,
                        mini: true,
                        padding: EdgeInsets.all(12.0),
                        elevation: 14.0,
                        onPressed: () {
                          launch(
                              'https://github.com/asadpro?tab=repositories ');
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 33.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
