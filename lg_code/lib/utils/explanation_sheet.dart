import 'package:flutter/material.dart';
import '../models/picture_data_model.dart';

//this is used for the bottom sheet that opens up with the image explanation when image is pressed

class ExplanationSheet {
  static void bottomSheets(BuildContext context, PictureModel pictureModel) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(210, 230, 247, 255),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Center(
                child: Text(
                  "Explanation",
                  style: TextStyle(
                      color: Color.fromARGB(255, 45, 95, 112),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontFamily: "Poppins"),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    pictureModel.explanation,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 26, 64, 77),
                        fontSize: 20,
                        fontFamily: "Roboto"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
