import 'package:flutter/material.dart';
import 'package:plant_disease_detection/routes/routes.dart';
import 'package:plant_disease_detection/utilities/plant_container.dart';

class Diseases extends StatefulWidget {
  @override
  State<Diseases> createState() => _DiseasesState();
}

class _DiseasesState extends State<Diseases> {
  Map saeed = {
    'path': 'assets/plantImages/1.jpg',
    'name': 'Pepper bell Bacterial spot'
  };
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushNamed(context, AppRoutes.homePage),
          ),
          title: Text('Diseases'),
          centerTitle: true,
        ),
        body: CustomScrollView(
          primary: true,
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.all(12),
              sliver: SliverGrid.count(
                childAspectRatio: 1 / 1.5,
                crossAxisCount: 2,
                children: <Widget>[
                  PlantContainer(
                    imageAddress: 'assets/plantImages/1.jpg',
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
                  PlantContainer(
                    imageAddress: 'assets/plantImages/2.jpg',
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
                  PlantContainer(
                    imageAddress: 'assets/plantImages/3.jpg',
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
                  PlantContainer(
                    imageAddress: 'assets/plantImages/4.jpg',
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
                  PlantContainer(
                    imageAddress: 'assets/plantImages/5.jpg',
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
                  PlantContainer(
                    imageAddress: 'assets/plantImages/6.jpg',
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
                  PlantContainer(
                    imageAddress: 'assets/plantImages/7.jpg',
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
                  PlantContainer(
                    imageAddress: 'assets/plantImages/8.jpg',
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
                  PlantContainer(
                    imageAddress: 'assets/plantImages/9.jpg',
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
                  PlantContainer(
                    imageAddress: 'assets/plantImages/10.jpg',
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
                  PlantContainer(
                    imageAddress: 'assets/plantImages/11.jpg',
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
                  PlantContainer(
                    imageAddress: 'assets/plantImages/12.jpg',
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
                  PlantContainer(
                    imageAddress: 'assets/plantImages/13.jpg',
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
                  PlantContainer(
                    imageAddress: 'assets/plantImages/14.jpg',
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
                  PlantContainer(
                    imageAddress: 'assets/plantImages/15.jpg',
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
