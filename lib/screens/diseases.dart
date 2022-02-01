import 'package:flutter/material.dart';
import 'package:plant_disease_detection/utilities/helper.dart';
import 'package:plant_disease_detection/routes/routes.dart';
import 'package:plant_disease_detection/utilities/plant_container.dart';

class Diseases extends StatefulWidget {
  @override
  State<Diseases> createState() => _DiseasesState();
}

class _DiseasesState extends State<Diseases> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushNamed(context, AppRoutes.homePage),
        ),
        title: Text('Diseases'),
        centerTitle: true,
      ),
      body: Scrollbar(
        interactive: true,
        isAlwaysShown: true,
        thickness: 12.0,
        radius: Radius.circular(12.0),
        showTrackOnHover: true,
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // box 1
                  PlantContainer(
                    plantName: 'Pepper Bell Bacterial Spot',
                    onPress: () {
                      Map saeed = {
                        'path': 'assets/plantImages/1.jpg',
                        'name': 'Pepper bell Bacterial spot'
                      };
                      Navigator.pushNamed(context, AppRoutes.diseaseImages,
                          arguments: saeed);
                    },
                  ),

                  SizedBox(height: screenHeight(context) * 0.03),

                  // box 2
                  PlantContainer(
                    plantName: 'Pepper Bell Healthy',
                    onPress: () {
                      Map saeed = {
                        'path': 'assets/plantImages/2.jpg',
                        'name': 'Pepper bell healthy'
                      };
                      Navigator.pushNamed(context, AppRoutes.diseaseImages,
                          arguments: saeed);
                    },
                  ),

                  SizedBox(height: screenHeight(context) * 0.03),

                  // box 3
                  PlantContainer(
                    plantName: 'Potato Early Blight',
                    onPress: () {
                      Map saeed = {
                        'path': 'assets/plantImages/3.jpg',
                        'name': 'Potato Early blight',
                      };
                      Navigator.pushNamed(context, AppRoutes.diseaseImages,
                          arguments: saeed);
                    },
                  ),

                  SizedBox(height: screenHeight(context) * 0.03),

                  // box 4
                  PlantContainer(
                    plantName: 'Potato Healthy',
                    onPress: () {
                      Map saeed = {
                        'path': 'assets/plantImages/4.jpg',
                        'name': 'Potato healthy',
                      };
                      Navigator.pushNamed(context, AppRoutes.diseaseImages,
                          arguments: saeed);
                    },
                  ),
                  SizedBox(height: screenHeight(context) * 0.03),
                  // box 5
                  PlantContainer(
                    plantName: 'Potato Late Blight',
                    onPress: () {
                      Map saeed = {
                        'path': 'assets/plantImages/5.jpg',
                        'name': 'Potato Late blight',
                      };
                      Navigator.pushNamed(context, AppRoutes.diseaseImages,
                          arguments: saeed);
                    },
                  ),
                  SizedBox(height: screenHeight(context) * 0.03),
                  // box 6
                  PlantContainer(
                    plantName: 'Tomato Target Spot',
                    onPress: () {
                      Map saeed = {
                        'path': 'assets/plantImages/6.jpg',
                        'name': 'Tomato Target Spot',
                      };
                      Navigator.pushNamed(context, AppRoutes.diseaseImages,
                          arguments: saeed);
                    },
                  ),
                  SizedBox(height: screenHeight(context) * 0.03),
                  // box 7
                  PlantContainer(
                    plantName: 'Tomato Mosaic Virus',
                    onPress: () {
                      Map saeed = {
                        'path': 'assets/plantImages/7.jpg',
                        'name': 'Tomato Tomato mosaic virus',
                      };
                      Navigator.pushNamed(context, AppRoutes.diseaseImages,
                          arguments: saeed);
                    },
                  ),
                  SizedBox(height: screenHeight(context) * 0.03),
                  // box 8
                  PlantContainer(
                    plantName: 'Tomato Yellow\n Leaf Curl Virus',
                    onPress: () {
                      Map saeed = {
                        'path': 'assets/plantImages/8.jpg',
                        'name': 'Tomato Tomato Yellow Leaf Curl Virus',
                      };
                      Navigator.pushNamed(context, AppRoutes.diseaseImages,
                          arguments: saeed);
                    },
                  ),
                  SizedBox(height: screenHeight(context) * 0.03),
                  // box 9
                  PlantContainer(
                    plantName: 'Tomato Bacterial Spot',
                    onPress: () {
                      Map saeed = {
                        'path': 'assets/plantImages/9.jpg',
                        'name': 'Tomato Bacterial spot',
                      };
                      Navigator.pushNamed(context, AppRoutes.diseaseImages,
                          arguments: saeed);
                    },
                  ),
                  SizedBox(height: screenHeight(context) * 0.03),
                  // box 10
                  PlantContainer(
                    plantName: 'Tomato Early Blight',
                    onPress: () {
                      Map saeed = {
                        'path': 'assets/plantImages/10.jpg',
                        'name': 'Tomato Early blight',
                      };
                      Navigator.pushNamed(context, AppRoutes.diseaseImages,
                          arguments: saeed);
                    },
                  ),
                  SizedBox(height: screenHeight(context) * 0.03),
                  // box 11
                  PlantContainer(
                    plantName: 'Tomato Healthy',
                    onPress: () {
                      Map saeed = {
                        'path': 'assets/plantImages/11.jpg',
                        'name': 'Tomato healthy',
                      };
                      Navigator.pushNamed(context, AppRoutes.diseaseImages,
                          arguments: saeed);
                    },
                  ),
                  SizedBox(height: screenHeight(context) * 0.03),
                  // box 12
                  PlantContainer(
                    plantName: 'Tomato Late Blight',
                    onPress: () {
                      Map saeed = {
                        'path': 'assets/plantImages/12.jpg',
                        'name': 'Tomato Late blight',
                      };
                      Navigator.pushNamed(context, AppRoutes.diseaseImages,
                          arguments: saeed);
                    },
                  ),

                  SizedBox(height: screenHeight(context) * 0.03),
                  // box 13
                  PlantContainer(
                    plantName: 'Tomato Leaf Mold',
                    onPress: () {
                      Map saeed = {
                        'path': 'assets/plantImages/13.jpg',
                        'name': 'Tomato Leaf Mold',
                      };
                      Navigator.pushNamed(context, AppRoutes.diseaseImages,
                          arguments: saeed);
                    },
                  ),

                  SizedBox(height: screenHeight(context) * 0.03),
                  // box 14
                  PlantContainer(
                    plantName: 'Tomato Septoria Leaf Spot',
                    onPress: () {
                      Map saeed = {
                        'path': 'assets/plantImages/14.jpg',
                        'name': 'Tomato Septoria leaf spot',
                      };
                      Navigator.pushNamed(context, AppRoutes.diseaseImages,
                          arguments: saeed);
                    },
                  ),
                  SizedBox(height: screenHeight(context) * 0.03),

                  // box 14
                  PlantContainer(
                    plantName: 'Tomato Spider Mites\nTwo-potted Spider Mite',
                    onPress: () {
                      Map saeed = {
                        'path': 'assets/plantImages/15.jpg',
                        'name': 'Tomato Spider mites Two-spotted spider mite',
                      };
                      Navigator.pushNamed(context, AppRoutes.diseaseImages,
                          arguments: saeed);
                    },
                  ),

                  SizedBox(height: screenHeight(context) * 0.03),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
