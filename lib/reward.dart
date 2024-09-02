import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:m_app_event/re.dart';

class RewardPage extends StatefulWidget {
  const RewardPage({super.key});

  @override
  _RewardPageState createState() => _RewardPageState();
}

class _RewardPageState extends State<RewardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 19, 2, 110),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Reward',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 19, 2, 110),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Lottie.asset(
                'animation/coin3.json',
                width: 300,
                height: 300,
                reverse: false,
                repeat: false,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 50),
            Text(
              'Your Reward Amount:',
              style: TextStyle(fontSize: 29, color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              '₹$reward',
              style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 34, 255, 0)),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
