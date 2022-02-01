import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plant_disease_detection/routes/routes.dart';
import 'package:plant_disease_detection/screens/drawer.dart';
import 'package:tflite/tflite.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Ubuntu-Regular',
        colorScheme: ColorScheme.fromSwatch(brightness: Brightness.dark),
        appBarTheme: AppBarTheme(
          color: Colors.green,
          titleTextStyle:
              TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
        ),
        cardTheme: CardTheme(
          elevation: 13.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          color: Colors.grey[900],
          margin: EdgeInsets.all(10.0),
        ),
      ),
      title: 'Plant Application',
      initialRoute: "/",
      routes: AppRoutes.appRoutes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? selectedImage;
  String? message = '';

  Future loadMyModel() async {
    var resultant = await Tflite.loadModel(
      labels: "assets/labels.txt",
      model: "assets/model_unquant.tflite",
    );

    print("result after loading model: $resultant");
  }

  @override
  void initState() {
    super.initState();
    loadMyModel();
  }

  late List _result;
  String _confidence = "";
  String name = "";
  String numbers = "";

  predict(File file) async {
    var res = await Tflite.runModelOnImage(
        path: file.path,
        numResults: 15,
        threshold: 0.5,
        imageMean: 127.5,
        imageStd: 127.5);

    String imagePath = file.path;

    setState(() {
      _result = res!;

      if (_result.isEmpty) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: IconButton(
                icon: Icon(
                  Icons.warning,
                  color: Colors.yellow,
                ),
                iconSize: 55.0,
                onPressed: () {},
              ),
              content: Text(
                'File could not be uploaded for some reason !!. Please go back and fix the problem.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red),
              ),
              actions: [
                Center(
                  child: TextButton.icon(
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.homePage),
                    icon: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      size: 33.0,
                    ),
                    label: Text(
                      'Back Home',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            );
          },
        );
      } else {
        String str = _result[0]["label"];

        name = str.substring(2);

        Map saeed = {'path': imagePath, 'name': name};
        // ignore: unnecessary_null_comparison
        _confidence = _result != null
            ? (_result[0]["confidence"] * 100.0).toString().substring(0, 2) +
                "%"
            : "";

        Navigator.pushNamed(context, AppRoutes.infoScreen, arguments: saeed);
      }
    });
  }

  Future getImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    try {
      selectedImage = File(pickedImage!.path);
      setState(
        () {
          predict(selectedImage!);
        },
      );
    } catch (e) {
      print(e);
    }
  }

//created by me
  Future getCamera() async {
    final takeImage = await ImagePicker().pickImage(source: ImageSource.camera);
    try {
      selectedImage = File(takeImage!.path);
      setState(
        () {
          predict(selectedImage!);
        },
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Object? rcvdData = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background.gif'),
                    fit: BoxFit.cover),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Select Image',
                    style: TextStyle(
                        color: Color.fromARGB(255, 3, 248, 12),
                        fontSize: 38.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton.icon(
                        icon: Icon(
                          Icons.photo_camera,
                          size: 40.0,
                          color: Colors.orangeAccent,
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 73, 182, 118)),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                        label: Text('Camera'),
                        onPressed: () {
                          getCamera();
                        },
                      ),
                      SizedBox(
                        width: 35.0,
                      ),
                      TextButton.icon(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 73, 182, 118)),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                        onPressed: () {
                          getImage();
                        },
                        icon: Icon(
                          Icons.image,
                          size: 40.0,
                          color: Colors.orangeAccent,
                        ),
                        label: Text('Gallery '),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
