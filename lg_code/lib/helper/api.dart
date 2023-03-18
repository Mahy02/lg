import 'package:http/http.dart' as http;

//How our APi will be used?
/*
==> automatically every day when button on home page is pressed it gets ==> picture + explanataion + date + title
==> if generate random button is pressed it gets same output but for a random date (not today's image)
==>if calendar button is pressed, user chooses the date and output is upon that date
*/

/* Info for our end point:
//https://api.nasa.gov/planetary/apod   base url
//sxhne9d331EIyXyDQTFUQy6m9mz97UAJqnZUorJ0    api key
*/

class Api {
  //here we will have all the response functions we need=> get, post, delete....
  //this will be called on (get_service)

  //our get method:
  Future<http.Response> get({required String url}) async {
    //getting the response from the url (which will be inside the paramters of the functions)
    http.Response response = await http.get(Uri.parse(url));

    //checking on the response:
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode}');
    }
  }
}
