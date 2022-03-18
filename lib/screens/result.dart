import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:plant_disease_detection/main.dart';
import 'package:plant_disease_detection/mobile.dart';
import 'package:plant_disease_detection/routes/routes.dart';
import 'package:plant_disease_detection/utilities/constant.dart';
import 'package:plant_disease_detection/utilities/disease_cure.dart';
import 'package:plant_disease_detection/utilities/disease_symptoms.dart';
import 'package:plant_disease_detection/utilities/prescription.dart';
import 'package:plant_disease_detection/utilities/youtube_videos.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:url_launcher/url_launcher.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map rcvdData = ModalRoute.of(context)!.settings.arguments as Map;
    late String imagePath = rcvdData['path'];

    late String imageName = rcvdData['name'];
    DiseaseVideo diseaseVideo = DiseaseVideo();
    DiseaseCure diseaseCure = DiseaseCure();
    DiseaseSymptom diseaseSymptom = DiseaseSymptom();
    Prescription prescription = Prescription();
    getInfo() {
      Navigator.pushNamed(context, AppRoutes.diseaseImages,
          arguments: rcvdData);
    }

    // pdf function
    Future<void> _createPDF() async {
      PdfDocument document = PdfDocument();
      final page = document.pages.add();

      String? des = diseaseCure.returnDesc(imageName);
      String paragraphText = des!;

      String? per = prescription.returnPrescription(imageName);
      String paragraphText2 = per!;

      String? symp = diseaseSymptom.returnSymptom(imageName);
      String paragraphText3 = symp!;

      page.graphics.drawImage(
        PdfBitmap(await _readImageData(imagePath)),
        // Rect.fromLTRB(0, 0, 600, 200),
        Rect.fromLTRB(0, 0, 600, 300),
      );

// Create a new PDF document
// Create a new PDF text element class and draw the flow layout text.
//1

      page.graphics.drawString(
          'Cause of Disease', PdfStandardFont(PdfFontFamily.helvetica, 30),
          bounds: Rect.fromLTWH(
              0, 300, page.getClientSize().width, page.getClientSize().height));

      final PdfLayoutResult layoutResult = PdfTextElement(
              text: paragraphText,
              font: PdfStandardFont(PdfFontFamily.helvetica, 20),
              format: PdfStringFormat(
                  alignment: PdfTextAlignment.justify, lineSpacing: 3.0),
              brush: PdfSolidBrush(PdfColor(0, 0, 0)))
          .draw(
              page: page,
              bounds: Rect.fromLTWH(0, 330, page.getClientSize().width,
                  page.getClientSize().height),
              format: PdfLayoutFormat(layoutType: PdfLayoutType.paginate))!;

// Draw the next paragraph/content.
      page.graphics.drawLine(
          PdfPen(PdfColor(255, 0, 0)),
          Offset(0, layoutResult.bounds.bottom + 10),
          Offset(page.getClientSize().width, layoutResult.bounds.bottom + 10));

// Create a new PDF document
// Create a new PDF text element class and draw the flow layout text.
//2
      page.graphics.drawString(
          'Symptoms', PdfStandardFont(PdfFontFamily.helvetica, 30),
          bounds: Rect.fromLTWH(0, layoutResult.bounds.bottom + 10,
              page.getClientSize().width, page.getClientSize().height));
      final PdfLayoutResult layoutResult2 = PdfTextElement(
              text: paragraphText2,
              font: PdfStandardFont(PdfFontFamily.helvetica, 20),
              format: PdfStringFormat(
                  alignment: PdfTextAlignment.justify, lineSpacing: 3.0),
              brush: PdfSolidBrush(PdfColor(0, 0, 0)))
          .draw(
              page: page,
              bounds: Rect.fromLTWH(0, layoutResult.bounds.bottom + 40,
                  page.getClientSize().width, page.getClientSize().height),
              format: PdfLayoutFormat(layoutType: PdfLayoutType.paginate))!;

// Draw the next paragraph/content.
      page.graphics.drawLine(
          PdfPen(PdfColor(255, 0, 0)),
          Offset(0, layoutResult2.bounds.bottom + 10),
          Offset(page.getClientSize().width, layoutResult2.bounds.bottom + 10));

// Create a new PDF document
// Create a new PDF text element class and draw the flow layout text.
//3

      page.graphics.drawString(
        'Cure of disease',
        PdfStandardFont(PdfFontFamily.helvetica, 30),
        bounds: Rect.fromLTWH(0, layoutResult2.bounds.bottom + 10,
            page.getClientSize().width, page.getClientSize().height),
      );
      final PdfLayoutResult layoutResult3 = PdfTextElement(
              text: paragraphText3,
              font: PdfStandardFont(PdfFontFamily.helvetica, 20),
              format: PdfStringFormat(
                  alignment: PdfTextAlignment.justify, lineSpacing: 3.0),
              brush: PdfSolidBrush(PdfColor(0, 0, 0)))
          .draw(
              page: page,
              bounds: Rect.fromLTWH(0, layoutResult2.bounds.bottom + 40,
                  page.getClientSize().width, page.getClientSize().height),
              format: PdfLayoutFormat(layoutType: PdfLayoutType.paginate))!;

// Draw the next paragraph/content.
      // page.graphics.drawLine(
      //     PdfPen(PdfColor(255, 0, 0)),
      //     Offset(0, layoutResult3.bounds.bottom + 10),
      //     Offset(page.getClientSize().width, layoutResult3.bounds.bottom + 10));

      // page.graphics.drawImage(PdfBitmap(await _readImageData('one.jpg')),
      //       Rect.fromLTRB(0, layoutResult3.bounds.bottom + 20, 440, 700));

      List<int> bytes = document.save();
      document.dispose();

      saveAndLaunchFile(bytes, 'Output.pdf');
    }

    Widget returnImage() {
      if (rcvdData['path'] == 'null') {
        return Image(image: AssetImage('assets/one.jpg'));
      } else {
        return Image(
          image: FileImage(File(imagePath)),
          fit: BoxFit.fitWidth,
        );
      }
    }

    String returnStatus(String name) {
      late String status;
      if (name == 'Pepper bell healthy' ||
          name == 'Potato healthy' ||
          name == 'Tomato healthy') {
        return status = 'Healthy';
      } else {
        return status = 'Diseased';
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => MyHomePage(),
              ),
            );
          },
        ),
        title: const Text('Plant disease detection'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              elevation: 23.0,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22.0)),
                    height: 250.0,
                    width: double.infinity,
                    child: InteractiveViewer(child: returnImage()),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text('Analysis Report:', style: kTitleText),
                        ),
                        sizedBox,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Text(
                                'Diagnosed: ',
                                style: kTitleText,
                              ),
                              Text(
                                returnStatus(imageName),
                                style: returnStatus(imageName) == 'Healthy'
                                    ? TextStyle(
                                        fontSize: 22.0,
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                      )
                                    : TextStyle(
                                        fontSize: 22.0,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                      ),
                              ),
                            ],
                          ),
                        ),
                        sizedBox,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Name: $imageName',
                            style: kTitleText,
                          ),
                        )
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
                        Align(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            child: Text(
                              'Read more...',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: getInfo,
                          ),
                        ),
                        SizedBox(
                          height: 18.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                var videoUrl = diseaseVideo
                                    .returnVideo(rcvdData['name'].toString());
                                launch('$videoUrl');
                              },
                              child: Text(
                                'Watch Me',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, AppRoutes.homePage);
                              },
                              child: Text(
                                'Next Test',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: _createPDF,
                              child: Text(
                                'Share',
                              ),
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

// Read image function
Future<Uint8List> _readImageData(String name) async {
  final data = File(name);
  Uint8List imageRaw = await data.readAsBytes();
  return imageRaw;
}
