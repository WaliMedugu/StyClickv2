import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stylclick/shared/widgets/nav.dart';
import 'package:stylclick/modules/auth/login.dart';
import 'package:stylclick/modules/walkthrough.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    log('[SPLASH] SplashScreen initialized');
    _init();
  }

  void _init() async {
    await 2.seconds.delay;
    bool isLoggedIn = getBoolAsync('home', defaultValue: false);
    log('[SPLASH] Checking login status: isLoggedIn = $isLoggedIn');
    if (isLoggedIn) {
      log('[SPLASH] Navigating to Home Dashboard (Nav)');
      const Nav().launch(context, isNewTask: true);
    } else {
      bool showOnboarding = getBoolAsync('onboarding', defaultValue: true);
      log('[SPLASH] Checking onboarding status: showOnboarding = $showOnboarding');
      if (showOnboarding) {
        log('[SPLASH] Navigating to WalkthroughScreen');
        const WalkthroughScreen().launch(context, isNewTask: true);
      } else {
        log('[SPLASH] Navigating to LoginScreen');
        const LoginScreen().launch(context, isNewTask: true);
      }
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
