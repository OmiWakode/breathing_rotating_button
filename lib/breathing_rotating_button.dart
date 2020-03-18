library breathing_rotating_button;
import 'package:flutter/material.dart';
import 'dart:math' show Random, pi;


class BreathingRotatingButton extends StatefulWidget {
  final Color foreground;
  final Color background;
  final IconData icon;
  final Color iconColor;
  final double radius;
  final int duration;
  final bool rotate;
  BreathingRotatingButton({@required this.radius, this.background, this.foreground,this.icon, this.iconColor=Colors.teal, this.duration=500,this.rotate = true});
  @override
  _BreathingRotatingButtonState createState() => _BreathingRotatingButtonState();
}

class _BreathingRotatingButtonState extends State<BreathingRotatingButton> with TickerProviderStateMixin {
  //Rotation Animation
  AnimationController _circleAnimationController;
  Animation<double> _circleAnimation;


  // Breathing Animation
  AnimationController _breathingController;
  var _breathe = 0.0;

  //Breathe animation bool
  bool _animationStart1 = false;

  //Breathe Animation Bool
  bool _animationStart = true;
  double random = 1.0;


  @override
  void initState() {
    super.initState();

    // Rotaion Animation

    _circleAnimationController = AnimationController(
      vsync: this,
      //you can set the time here
      duration: Duration(milliseconds: widget.duration),
    );

    _circleAnimation = CurvedAnimation(
        parent: _circleAnimationController, curve: Curves.linear);
    _circleAnimation.addListener(() => this.setState(() {}));
    _circleAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //outer breathing stops
        _animationStart = false;
      }
    });


    // breathingButton Animation

    _breathingController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _breathingController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _breathingController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _breathingController.forward();
      }
    });
    _breathingController.addListener(() {
      setState(() {
        _breathe = _breathingController.value;
      });
    });
    _breathingController.forward();


    // Resetting the animations
  }

  dispose() {
    _circleAnimationController?.dispose();
    _breathingController?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    //customise your size here
    double outerBreathingRadius = widget.radius -
        (widget.radius / 24) * _breathe;
    double innerBreathingRadius = widget.radius*1.6 -
        (widget.radius/ 20) * _breathe;
    //customize your screen
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(_animationStart1?widget.radius*_circleAnimation.value/8:0),
              child :GestureDetector(
                onTap: () {
                  _circleAnimationController.forward();
                  _animationStart1 = true;
                  if (_animationStart) {
                    random = Random().nextDouble();
                  }
                },
                //Change your shapes from here
                child: CircleAvatar(
                    radius: _animationStart1
                        ? widget.radius-widget.radius*_circleAnimation.value/8
                        : outerBreathingRadius, // 1st Circle
                    backgroundColor: widget.background,
                    child: Container(
                      decoration: BoxDecoration(
                        color: widget.foreground, // 2nd Circle
                        shape: BoxShape.circle,
                      ),
                      //This is the animation
                      child: widget.rotate?Transform.rotate(
                        angle: (_circleAnimation.value * widget.duration/15 * pi) -
                            (2 * pi * random),
                        child: Icon(widget.icon,
                          size: _animationStart
                              ? widget.radius*1.6
                              : innerBreathingRadius,
                          color: widget.iconColor,
                        ),
                      ):widget.icon==null?Container():Icon(widget.icon,
                        size: _animationStart
                            ? widget.radius*1.6
                            : innerBreathingRadius,
                        color: widget.iconColor,
                      ),
                    )),
          ),
        ),
      ],
    );
  }
}



