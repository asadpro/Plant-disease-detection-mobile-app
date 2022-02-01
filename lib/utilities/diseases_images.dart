import 'dart:io';

import 'package:flutter/material.dart';
import 'package:plant_disease_detection/utilities/disease_cure.dart';
import 'package:plant_disease_detection/utilities/constant.dart';
import 'package:plant_disease_detection/utilities/disease_symptoms.dart';
import 'package:plant_disease_detection/utilities/prescription.dart';
import 'package:plant_disease_detection/utilities/youtube_videos.dart';
import 'package:url_launcher/url_launcher.dart';

class DiseaseImages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map rcvdData = ModalRoute.of(context)!.settings.arguments as Map;
    late String imagePath = rcvdData['path'];
    late String imageName = rcvdData['name'];
    DiseaseCure diseaseCure = DiseaseCure();
    DiseaseVideo diseaseVideo = DiseaseVideo();
    DiseaseSymptom diseaseSymptom = DiseaseSymptom();
    Prescription prescription = Prescription();

    String cacheImageAddress = 'data';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Plant disease detection'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              elevation: 23.0,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Column(
                children: [
                  // Showing image
                  InteractiveViewer(
                    child: imagePath.contains(cacheImageAddress)
                        ? Image.file(
                            File(imagePath),
                            width: double.infinity,
                            height: 300.0,
                            fit: BoxFit.cover,
                          )
                        : Image(
                            height: 300.0,
                            width: double.infinity,
                            image: AssetImage(imagePath),
                            fit: BoxFit.cover,
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 12.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      // showing imageName
                      child: SelectableText('Name⇉ $imageName ',
                          style: TextStyle(
                              fontSize: 26.0, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Divider(
                    thickness: 3.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: SelectableText('Cause of Disease',
                              style: kTitleText),
                        ),
                        sizedBox,
                        SelectableText(
                          '${diseaseCure.returnDesc(imageName)}',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        sizedBox,
                        Align(
                          alignment: Alignment.topLeft,
                          child: SelectableText('Symptoms', style: kTitleText),
                        ),
                        sizedBox,
                        SelectableText(
                          '${diseaseSymptom.returnSymptom(imageName)}',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        sizedBox,
                        Align(
                          alignment: Alignment.topLeft,
                          child: SelectableText('Cure of disease',
                              style: kTitleText),
                        ),
                        sizedBox,
                        SelectableText(
                          '${prescription.returnPrescription(imageName)}',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15.0,
                        ),
                        TextButton.icon(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white),
                          ),
                          onPressed: () {
                            var videoUrl = diseaseVideo
                                .returnVideo(rcvdData['name'].toString());
                            launch('$videoUrl');
                          },
                          icon: Icon(
                            Icons.play_circle_filled_outlined,
                            size: 35.0,
                          ),
                          label: Text(
                            'Watch Me',
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
