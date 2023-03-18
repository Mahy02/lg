import 'dart:convert';
import 'package:lg/models/picture_data_model.dart';
import '../helper/api.dart';
import 'package:http/http.dart';

//API KEY: sxhne9d331EIyXyDQTFUQy6m9mz97UAJqnZUorJ0
//date is either today's date or date the user pressed on the calendar:

class AllPictureServices {
  static Future<PictureModel> getPicture({required DateTime date}) async {
    //our model:
    PictureModel? pictureData;

    //format the date according to the correct format of the api: yyyy-mm-dd
    String formattedDate =
        "${date.year}-${_twoDigitFormat(date.month)}-${_twoDigitFormat(date.day)}";

    //get response with date
    Response response = await Api().get(
        url:
            'https://api.nasa.gov/planetary/apod?api_key=sxhne9d331EIyXyDQTFUQy6m9mz97UAJqnZUorJ0&date=$formattedDate');

    //our data in the api is a map with string as key and dynamic as value
    Map<String, dynamic> data = jsonDecode(response.body);

    //data  after decoding it:
    pictureData = PictureModel.fromJson(data);

    return pictureData;
  }

  //for changing format of the date:
  static String _twoDigitFormat(int n) {
    return n.toString().padLeft(2, '0');
  }
}
