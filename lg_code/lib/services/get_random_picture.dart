import 'dart:convert';
import 'package:lg/models/picture_data_model.dart';
import '../helper/api.dart';
import 'package:http/http.dart';

//API KEY: sxhne9d331EIyXyDQTFUQy6m9mz97UAJqnZUorJ0
//this is exactly similar to get picture service but uses different ednpoint so we put it here
//count=1 means will generate random image (1 only)

class RandomPictureServices {
  static Future<List<PictureModel>> getPicture() async {
    //get response with 1 as count => 1 random image
    Response response = await Api().get(
        url:
            'https://api.nasa.gov/planetary/apod?api_key=sxhne9d331EIyXyDQTFUQy6m9mz97UAJqnZUorJ0&count=1');

    //our data in the api is a List of map of key value pairs ==> so a list of dynamic will be used
    List<dynamic> data = jsonDecode(response.body);

    //data after decoding it:
    //note that we only want the first item in the list as count will always be =1
    List<PictureModel> picturelist = [];
    picturelist.add(PictureModel.fromJson(data[0]));

    return picturelist;
  }
}
