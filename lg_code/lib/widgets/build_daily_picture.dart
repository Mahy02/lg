import 'package:flutter/material.dart';
import '../utils/explanation_sheet.dart';

//for the daily pictures:
class BuildPictureWidget extends StatelessWidget {
  const BuildPictureWidget({
    super.key,
    required this.data,
  });

  final data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ExplanationSheet.bottomSheets(
            context, data); //the explanation button pop up
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                //title of the image::::::::::::::::::::::::::::
                Center(
                  child: Text(
                    data.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "Roboto",
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                //for space below text
                const SizedBox(
                  height: 30,
                ),
                //for teh image itself:::::::::::::::::::::::::::::::::::::::::::
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(data.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: 400,
                    width: double.infinity,
                  ),
                ),
              ],
            ),
          ),
          //for some space below the image:::::::::::::::::::::::::::::::::::::::::::::
          const SizedBox(
            height: 20,
          ),
          //for the date and text below teh image:::::::::::::::::::::::::::::::::::::::::
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Date:",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Roboto",
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                data.date,
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: "Roboto",
                    fontSize: 20,
                    fontStyle: FontStyle.italic),
              ),
            ],
          ),
          //some space below::::::::::::::::::::::::::::::::::::::::::::
          const SizedBox(
            height: 30,
          ),
          //text:::::::::::::::::::::::::::::::::::::::::::::::::::::::::
          const Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Text(
              "Click on the image for more explanation!",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Roboto",
                fontSize: 18,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
