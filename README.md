# breathing_rotating_button

A Flutter package for custom made breathing and rotating button written in Dart.

#### Do star the repo. Thanks :+1:
### Screenshots
 <img src="https://github.com/OmiWakode/breathing_rotating_button/blob/master/Screenshot_20200226-181609.png"width="256" height="455">
![image](https://github.com/OmiWakode/breathing_rotating_button/blob/master/BreatheRotate.gif)
### Usage
[Example](https://github.com/OmiWakode/breathing_rotating_button/blob/master/example/example_app.dart)
To use this package:
 * add the dependency to your pubspec [pubspec.yaml](https://github.com/OmiWakode/breathing_rotating_button/blob/master/pubspec.yaml) file.
 ```
    dependencies:
        flutter:
            sdk: flutter
        breathing_rotating_button:
 ```
### How to use
 ```
 class SpinScreen extends StatefulWidget {
   @override
   _SpinScreenState createState() => _SpinScreenState();
 }
 
 class _SpinScreenState extends State<SpinScreen> {
 
   @override
   Widget build(BuildContext context) {
     // your screen
     return Material(
       color: Colors.white,
       child: Padding(
         padding: const EdgeInsets.all(40.0),
         //The widget is called here
         /*duration is in milliseconds and rest parameters are conventional, rotate is a bool which describes whether to rotate or not.
         icon can also be added, but you can skip it if you want.
         That's it ;)*/
         child: BreathingRotatingButton(background: Colors.teal, foreground: Colors.white, 
         icon: Icons.person, iconColor: Colors.white, radius: 70, duration: 1000, rotate: true,),
       ),
     );
   }
 }
 ```
### Created and Maintained by
[Omi Wakode](https://github.com/OmiWakode)




### Getting Started
This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
