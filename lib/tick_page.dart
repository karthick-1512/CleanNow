import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:m_app_event/home_bottom.dart';

class Ani extends StatefulWidget {
  const Ani({super.key});

  @override
  State<Ani> createState() => _AniState();
}

class _AniState extends State<Ani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Align children to the bottom
            children: [
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Lottie.asset(
              'animation/1.json',
              width: 300,
              height: 300,
              reverse: false,
              repeat: false,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Text(
            'Submitted!!!',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
          ),
          SizedBox(
            height: 100,
          ), // Add some space between the animation and the button
          Row(
            children: [
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  elevation: 10,

                  padding: EdgeInsets.all(
                      20), // Increase the padding to make the button bigger
                  textStyle:
                      TextStyle(fontSize: 20), // Increase the font size here
                ),
                child: Text('    Home    '),
              ),
              Spacer()
            ],
          ),
          // SizedBox(
          //   height: 20,
          // )
        ]));
  }
}
