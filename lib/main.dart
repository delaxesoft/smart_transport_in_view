import 'package:flutter/material.dart';
import './splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
