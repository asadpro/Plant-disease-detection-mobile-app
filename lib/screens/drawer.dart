import 'dart:io';

import 'package:flutter/material.dart';
import 'package:plant_disease_detection/main.dart';
import 'package:plant_disease_detection/screens/diseases.dart';
import 'package:plant_disease_detection/screens/loading_screen.dart';
import 'package:plant_disease_detection/utilities/about.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.green,
      child: Column(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 220.0,
                margin: EdgeInsets.only(
                  top: 30,
                ),
                child: Image.asset(
                  'assets/drawer.gif',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  gradient: LinearGradient(
                    colors: const [
                      Colors.blue,
                      Colors.purple,
                    ],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                  ),
                ),
                height: 44.0,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(top: 7.0),
                  child: Text(
                    'Plant Disease Detection',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
          ListTile(
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            leading: Icon(Icons.home, color: Colors.white),
            title: Text(
              'Home',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => MyHomePage()));
            },
          ),
          Divider(
            color: Colors.white30,
          ),
          ListTile(
              trailing: Icon(Icons.arrow_forward_ios_rounded),
              leading: Icon(
                Icons.medical_services_outlined,
                color: Colors.white,
              ),
              title: Text(
                'Disease information',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => Diseases()));
              }),
          Divider(
            color: Colors.white30,
          ),
          ListTile(
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            leading: Icon(
              Icons.location_on_outlined,
              color: Colors.white,
            ),
            title: Text(
              'Weather Forecast',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => LoadingScreen(),
              ));
            },
          ),
          Divider(
            color: Colors.white30,
          ),
          ListTile(
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            leading: Icon(
              Icons.app_settings_alt,
              color: Colors.white,
            ),
            title: Text(
              'About Us',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (_) => About(),
              ));
            },
          ),
          Divider(
            color: Colors.white30,
          ),
          ListTile(
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            title: Text(
              'Exit',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                      'Exit App',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                    content: Text('Do you really want to exit the app?'),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          child: Text('No')),
                      ElevatedButton(
                          onPressed: () => exit(0), child: Text('Yes')),
                    ],
                  );
                },
              );
            },
          ),
          Divider(
            color: Colors.white30,
          ),
        ],
      ),
    );
  }
}
