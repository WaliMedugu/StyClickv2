import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stylclick/shared/widgets/nav.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    await 2.seconds.delay;
    if (getBoolAsync('home', defaultValue: false)) {
      const Nav().launch(context, isNewTask: true);
    } else {
      // Assuming Walkthrough or Login is the next step
      // For now, following the Nav bypass logic from main.dart
      const Nav().launch(context, isNewTask: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fullScreen/splashScreen2.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
