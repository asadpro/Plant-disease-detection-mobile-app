import 'package:plant_disease_detection/main.dart';
import 'package:plant_disease_detection/screens/diseases.dart';
import 'package:plant_disease_detection/screens/drawer.dart';
import 'package:plant_disease_detection/screens/location_screen.dart';
import 'package:plant_disease_detection/screens/result.dart';
import 'package:plant_disease_detection/screens/splash_screen.dart';
import 'package:plant_disease_detection/utilities/about.dart';
import 'package:plant_disease_detection/utilities/diseases_images.dart';

class AppRoutes {
  static const homePage = "/homePage";
  static const secondScreen = "/secondscreen";
  static const infoScreen = "/infoscreen";
  static const aboutScreen = "/aboutscreen";
  static const diseaseScreen = "/diseasescreen";
  static const diseaseImages = "/diseaseimages";
  static const drawer = "/drawer";
  // static const locationScreen = "/locationScreen";

  static final appRoutes = {
    '/': (context) => SplashScreen(),
    secondScreen: (context) =>
        const MyHomePage(title: 'Plant disease detection'),
    infoScreen: (context) => Info(),
    aboutScreen: (context) => About(),
    diseaseScreen: (context) => Diseases(),
    diseaseImages: (context) => DiseaseImages(),
    homePage: (context) => MyHomePage(
          title: 'Plant disease detection',
        ),
    drawer: (context) => MainDrawer(),
    // locationScreen: (context) => LocationScreen(
    //       cityNewName: 'peshawar',
    //     )
  };
}
