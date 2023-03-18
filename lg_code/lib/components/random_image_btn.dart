import 'package:flutter/material.dart';

//this widget is for the random button style ==> when pressed in picture.dart it will show random image

class RandomImageButton extends StatefulWidget {
  final VoidCallback onPressed;
  const RandomImageButton({Key? key, required this.onPressed})
      : super(key: key);

  @override
  _RandomImageButtonState createState() => _RandomImageButtonState();
}

class _RandomImageButtonState extends State<RandomImageButton> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 700, //a space between image and floating button
        ),
        SizedBox(
          //for the floating elevated button
          height: 50,
          width: 130,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    20), // Set circular border radius here
              ),
              primary: Colors.white,
              onPrimary: Color.fromRGBO(4, 8, 9, 0.682),
              elevation: 8,
              shadowColor: Color.fromARGB(255, 167, 204, 255),
            ),
            onPressed: () async {
              setState(() {
                _isLoading = true;
              });
              widget.onPressed();
              setState(() {
                _isLoading = false;
              });
            },
            child: _isLoading
                ? const CircularProgressIndicator()
                : const Center(
                    child: Text(
                      'Random ',
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
      ],
    );
  }
}
