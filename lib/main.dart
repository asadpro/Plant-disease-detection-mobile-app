import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plant_disease_detection/routes/routes.dart';
import 'package:plant_disease_detection/screens/drawer.dart';
import 'package:plant_disease_detection/utilities/constant.dart';
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
          centerTitle: true,
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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  late Animation borderShape;

  File? selectedImage;
  String? message = '';

  Future loadMyModel() async {
    var resultant = await Tflite.loadModel(
      labels: "assets/plant_labels.txt",
      model: "assets/plant_predictor_tf_binary_15.tflite",
    );

    print("result after loading model: $resultant");
  }


  //check Image For Not Plants
  checkImage(File file) async
  {
    

    var resalt = await Tflite.runModelOnImage(
        path: file.path,
        numResults: 2,
        threshold: 0.5,
        imageMean: 127.5,
        imageStd: 127.5);

    //String imagePath = file.path;
    print("first res");
    print(resalt![0]["label"]);

   print(resalt[0]["label"]==" plant");

   // return;


    
    if(resalt[0]["label"]==" plant") {
      print("helloooooo");
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
                'The Image does not seem to be a leaf. Do you still want to continiue?',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red),
              ),
              actions: [
                Center(
                  child: TextButton.icon(
                    onPressed: () async {
                        var resultantant = await Tflite.loadModel(
                                    labels: "assets/labels.txt",
                                    model: "assets/model_unquant.tflite",
                                  );
                 print("result after loading model: $resultantant");
                        predict(file);},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 33.0,
                    ),
                    label: Text(
                      'Predict Anyway..',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            );
          },
        );
      } else {
        //Navigator.pushNamed(context, AppRoutes.homePage);
        var resultantant = await Tflite.loadModel(
                                    labels: "assets/labels.txt",
                                    model: "assets/model_unquant.tflite",
                                  );
                 print("result after loading model: $resultantant");
                        predict(file);
      }


  }






  @override
  void initState() {
    super.initState();
    loadMyModel();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    animation =
        ColorTween(begin: Colors.blue, end: Colors.green).animate(controller);

    borderShape = ShapeBorderTween(
      begin: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      end: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    ).animate(controller);

    controller.forward();

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse(from: 1.0);
      } else if (status == AnimationStatus.dismissed) {
        controller.forward(from: 0.0);
      }
    });
    controller.addListener(() {
      setState(() {});
    });
  }









  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  late List _result;
  String _confidence = "";
  String name = "";
  String numbers = "";

  Future<dynamic> predict(File file) async {
    var res = await Tflite.runModelOnImage(
      path: file.path,
      numResults: 15,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    String imagePath = file.path;

    setState(() {
      _result = res!;
      //if (_result.isEmpty || _result[0]['label'] == '  Tomato Late blight') 
      if (_result.isEmpty) 
      
      {
        showGeneralDialog(
            barrierColor: Colors.black.withOpacity(0.5),
            transitionBuilder: (context, a1, a2, widget) {
              return Transform.rotate(
                angle: math.radians(a1.value * 360),
                child: Opacity(
                  opacity: a1.value,
                  child: AlertDialog(
                    insetPadding: EdgeInsets.zero,
                    backgroundColor: Colors.white,
                    shape: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(16.0)),
                    title: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.red,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.warning,
                                color: Colors.yellow,
                              ),
                              iconSize: 55.0,
                              onPressed: () {},
                            ),
                            Text(
                              'ALERT....!!!',
                              style: kTitleText,
                            )
                          ],
                        )),
                    content: Text(
                      'File could not be uploaded due to  the wrong format/wrong image !!! Please go back and pick the image again.',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    actions: [
                      Center(
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18)),
                              padding: EdgeInsets.all(12)),
                          onPressed: () =>
                              Navigator.pushNamed(context, AppRoutes.homePage),
                          icon: Icon(
                            Icons.insert_photo_outlined,
                            size: 33.0,
                            color: Colors.yellow,
                          ),
                          label: Text(
                            'Back Home',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
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
          checkImage(selectedImage!);
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
          checkImage(selectedImage!);
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
          const message = 'Press back button again to exit';
          Fluttertoast.showToast(
            msg: message,
            fontSize: 14,
            backgroundColor: Colors.red,
          );

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
            backgroundColor: animation.value,
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
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 26, vertical: 15.0),
                              shape: borderShape.value,
                              primary: Colors.white,
                              backgroundColor: animation.value),
                          label: Text('Camera'),
                          onPressed: () {
                            getCamera();
                          },
                        ),
                        SizedBox(
                          width: 35.0,
                        ),
                        TextButton.icon(
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 26, vertical: 15.0),
                              shape: borderShape.value,
                              primary: Colors.white,
                              backgroundColor: animation.value),
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
