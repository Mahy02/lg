import 'package:flutter/material.dart';
import '../utils/explanation_sheet.dart';

//for building random pictures
class BuildRandomPictureWidget extends StatelessWidget {
  const BuildRandomPictureWidget({
    super.key,
    required this.data,
    required this.index,
  });

  final data;
  final index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ExplanationSheet.bottomSheets(context, data[index]);
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                Center(
                  child: Text(
                    data[index].title,
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
                //for size below text
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: NetworkImage(data[index].image),
                            fit: BoxFit.cover,
                          ),
                        ),
                        height: 400,
                        width: double.infinity,
                      ),
                     
                    ],
                  ),
                ),
                //for some space below the image
                const SizedBox(
                  height: 20,
                ),
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
                      data[index].date,
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Roboto",
                          fontSize: 20,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
                //some space below:
                const SizedBox(
                  height: 30,
                ),
                //text:
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
