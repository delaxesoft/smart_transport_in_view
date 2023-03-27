import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './main.dart';
import './turn_by_turn.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToHomeScreen();
  }

  void navigateToHomeScreen() {
    // Future.delayed(Duration(seconds: 3), () {
    //   Navigator.pushNamed(context, '/home');
    // });

    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => TurnByTurn()),
      );
    });

    // Future.delayed(Duration(seconds: 3), () {
    //   Navigator.pushAndRemoveUntil(
    //       context, MaterialPageRoute(builder: (_) => Home()), (route) => false);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.indigo,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            CupertinoIcons.car_detailed,
            color: Colors.white,
            size: 120,
          ),
          Text(
            'Transport System',
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
