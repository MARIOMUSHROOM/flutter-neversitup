import 'package:never_test/nav.dart';
import 'package:never_test/splash_screen.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key, this.deeplink});
  final String? deeplink;
  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(seconds: 2));
      isLoading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoading) {
      return Nav(deeplink: widget.deeplink);
    } else {
      return const SplashScreen();
    }
  }
}
