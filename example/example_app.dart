import 'package:breathing_rotating_button/breathing_rotating_button.dart';
import 'package:flutter/material.dart';


class SpinScreen extends StatefulWidget {
  @override
  _SpinScreenState createState() => _SpinScreenState();
}

class _SpinScreenState extends State<SpinScreen> {


  @override
  Widget build(BuildContext context) {
    //customize your screen
    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: BreathingButton(background: Colors.teal, foreground: Colors.white, icon: Icons.person, radius: 70, duration: 1000, rotate: false,),
      ),
    );
  }
}
