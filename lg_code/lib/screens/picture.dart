//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:lg/models/picture_data_model.dart';
import 'package:lg/services/get_picture_services.dart';
import 'package:lg/services/get_random_picture.dart';
import '../components/random_image_btn.dart';
import '../widgets/build_daily_picture.dart';
import '../widgets/build_random_picture.dart';

class PicturePage extends StatefulWidget {
  const PicturePage({super.key});

  @override
  State<PicturePage> createState() => _PicturePageState();
}

class _PicturePageState extends State<PicturePage> {
  //our picture model (future as data is from an API)
  late Future<dynamic>
      _pictureModel; //either list or picturemodel accoridng to the endpoint

  //for date:
  DateTime _dateTime = DateTime.now();
  //to access the date:  _dateTime.toString().split(" ")[0]

  bool isLoading = false;

  //some functionallities we need:::::::::::::::::::::::::::::::::::::::::::
  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.utc(1995, 06, 16),
      lastDate: DateTime.now(),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
    ).then((value) {
      if (value != null) {
        setState(() {
          _dateTime = value;
          _pictureModel = AllPictureServices.getPicture(date: _dateTime);
        });
      } else {
        setState(() {
          _dateTime = DateTime.now();
          _pictureModel = AllPictureServices.getPicture(date: _dateTime);
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _pictureModel = AllPictureServices.getPicture(date: _dateTime);
  }

  //::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //The app bar with logo::::::::::::::::::::::::::::::::::::::::::::::::::::::::
      appBar: AppBar(
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 120,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/logo.png',
              width: 70,
              height: 70,
            ),
          ),
        ],
      ),

      //the backgroud color:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
      backgroundColor: const Color.fromRGBO(10, 17, 20, 0.682),

      //our body::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
      body: FutureBuilder(
        future: Future.value(_pictureModel),
        builder: (context, snapshot) {
          if (snapshot.hasData && !isLoading) {
            final data = snapshot.data;
            if (data is PictureModel) {
              return BuildPictureWidget(data: data);
            } else if (data is List<PictureModel>) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return BuildRandomPictureWidget(data: data, index: index);
                },
              );
            }
          } else if (snapshot.hasError && !isLoading) {
            return Text('Error: ${snapshot.error}');
          } else {
            // print("bla");
            return const Center(child: CircularProgressIndicator());
          }
          return Container();
        },
      ),

      //floating action buttons::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
      ////uses our customized widget RandomImageButton that genertates random images & elevated button for the date
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: SizedBox(
              height: 50,
              width: 130,
              child: Container(
                width: double.infinity, //for flexible width
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      // Set circular border radius here
                    ),
                    primary: Colors.white,
                    onPrimary: Color.fromRGBO(4, 8, 9, 0.682),
                    elevation: 8,
                    shadowColor: Color.fromARGB(255, 167, 204, 255),
                  ),
                  onPressed: _showDatePicker,
                  child: const Text(
                    "Pick a date",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(child: Container()),
          RandomImageButton(
            onPressed: () {
              setState(() {
                isLoading = true;
              });
              setState(() {
                isLoading = false;
                _pictureModel = RandomPictureServices.getPicture();
              });
            },
          ),
        ],
      ),
    );
  }
}
