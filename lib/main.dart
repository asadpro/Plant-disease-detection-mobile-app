import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plant_disease_detection/routes/routes.dart';
import 'package:plant_disease_detection/screens/drawer.dart';
import 'package:tflite/tflite.dart';
import 'package:vector_math/vector_math.dart' as math;
import 'package:fluttertoast/fluttertoast.dart';

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
        splashColor: Colors.purpleAccent,
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
  const MyHomePage({
    Key? key,
  }) : super(key: key);

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
        showGeneralDialog(
            barrierColor: Colors.black.withOpacity(0.5),
            transitionBuilder: (context, a1, a2, widget) {
              return Transform.rotate(
                angle: math.radians(a1.value * 360),
                child: Opacity(
                  opacity: a1.value,
                  child: AlertDialog(
                    shape: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(16.0)),
                    title: IconButton(
                      icon: Icon(
                        Icons.warning,
                        color: Colors.yellow,
                      ),
                      iconSize: 55.0,
                      onPressed: () {},
                    ),
                    content: Text(
                      'File could not be uploaded due to  some technical issues !!. Please go back and pick the right image format.',
                      style: TextStyle(color: Colors.red),
                    ),
                    actions: [
                      Center(
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.all(12)),
                          onPressed: () =>
                              Navigator.pushNamed(context, AppRoutes.homePage),
                          icon: Icon(
                            Icons.keyboard_backspace_outlined,
                            size: 33.0,
                          ),
                          label: Text(
                            'Back Home',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            transitionDuration: Duration(milliseconds: 600),
            barrierDismissible: true,
            barrierLabel: '',
            context: context,
            pageBuilder: (context, animation1, animation2) => Text('null'));
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

  DateTime timeBackPress = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final Object? rcvdData = ModalRoute.of(context)!.settings.arguments;

    return WillPopScope(
      onWillPop: () async {
        final difference = DateTime.now().difference(timeBackPress);
        final isExitWarning = difference >= Duration(seconds: 2);
        timeBackPress = DateTime.now();
        if (isExitWarning) {
          final message = 'Press back again to exit';
          Fluttertoast.showToast(
              msg: message, fontSize: 24, backgroundColor: Colors.red);

          return false;
        } else {
          Fluttertoast.cancel();
          return true;
        }
      },
      child: Scaffold(
          drawer: MainDrawer(),
          appBar: AppBar(
            title: Text("Plant disease detection"),
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
          )),
    );
  }
}
