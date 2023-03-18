//picture model will contain => image, explanation, date, title
//note that any map will be a model datatype

class PictureModel {
  final String explanation;
  final String image;
  final String title;
  final String date;

  PictureModel({
    required this.explanation,
    required this.image,
    required this.title,
    required this.date,
  });

  //our factory to get the jsondata for normal data
  factory PictureModel.fromJson(jsonData) {
    return PictureModel(
      explanation: jsonData['explanation'], //output
      image: jsonData['url'], //output
      title: jsonData['title'], //output
      date: jsonData['date'], //input and output
    );
  }

  @override
  String toString() {
    return 'title= $title picture= $image explanation= $explanation date=$date';
  }
}
