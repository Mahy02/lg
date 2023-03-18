import 'package:flutter/material.dart';
import 'package:lg/screens/picture.dart';

//In our home page we would need 1 button in the middle ==> ""
//we would need a background image
//we would need an app bar with the logo and title of the app

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      //our app bar will be transparent, having a centered title and a logo
      appBar: AppBar(
        title: const Text(
          'Galaxy Explorer',
          style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              fontFamily: "Roboto"),
        ), //our title
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

      //body: will have a background image (so we will need a stack in order to put stuff on teh background image) and a button in the middle
      body: Stack(
        children: [
          Image.asset(
            'assets/images/bg.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            color: const Color.fromRGBO(0, 0, 0, 0.1),
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PicturePage(),
                            //button to navigate to the picturepage
                          ),
                        );
                      },
                      //style of the elevated button:
                      style: ElevatedButton.styleFrom(
                        shadowColor: const Color.fromRGBO(208, 243, 247, 1),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        //we will use copy with to change the color when button is pressed
                      ).copyWith(backgroundColor:
                          MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          //checking if pressed
                          return const Color.fromRGBO(208, 243, 247, 1);
                        } else {
                          return const Color.fromRGBO(237, 109, 115, 1);
                        }
                      })),
                      //the text inside the button:
                      child: const Text(
                        'Explore what\'s new about the Galaxy!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
