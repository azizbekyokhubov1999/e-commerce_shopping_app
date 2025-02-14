import 'dart:async';

import 'package:flutter/material.dart';

import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  double _loadingProgress = 0.0;
  Timer? _progressTime;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this,
    duration: const Duration(milliseconds: 1500 ));

    _fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
     CurvedAnimation(
       parent: _controller,
       curve: Interval(0.0, 0.5, curve: Curves.easeOut),
     ),
    );

    _controller.forward();

    _startLoadingProgress();

    Timer(
      Duration(seconds: 3),
        () {
       If(mounted){
         Navigator.push(
           context, MaterialPageRoute(
           builder: (context) => OnBoardingScreen(),
         ),
         );
       }
    }
    );
  }
  void _startLoadingProgress(){
    const totalStages = 100;
    const stepDuration = Duration(milliseconds: 30);
    _progressTime = Timer.periodic(
        stepDuration,
        (Timer) {
          setState(() {
            if(_loadingProgress < 1.0){
              _loadingProgress += 1/totalStages;
            }else{
              _progressTime?.cancel();
            }
          });
        }
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    _progressTime?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
