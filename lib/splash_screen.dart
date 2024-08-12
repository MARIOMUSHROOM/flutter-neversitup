import 'package:never_test/commons/sizer.dart';
import 'package:never_test/setting/theme.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: Sizer(context).w * 0.5,
              width: Sizer(context).w * 0.5,
              child: Icon(Icons.home),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(color: primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
