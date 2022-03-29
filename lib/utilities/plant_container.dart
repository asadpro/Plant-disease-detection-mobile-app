import 'package:flutter/material.dart';

class PlantContainer extends StatelessWidget {
  const PlantContainer({
    required this.onPress,
    required this.plantName,
    required this.imageAddress,
  });

  final VoidCallback onPress;
  final String plantName;
  final String imageAddress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Card(
        child: GridTile(
          child: Image.asset(
            imageAddress,
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
              title: Text(
                plantName,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textScaleFactor: 1.2,
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              backgroundColor: Color.fromARGB(255, 139, 80, 216)),
        ),
      ),
    );
  }
}
