import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:stylclick/modules/account.dart';
import 'package:stylclick/modules/auth/login.dart';
import 'package:stylclick/modules/catalogue/catalogue.dart';
import 'package:stylclick/modules/edit_profile.dart';
import 'package:stylclick/modules/home.dart';
import 'package:stylclick/modules/select-tailor/select_tailor.dart';
import 'package:stylclick/modules/vendor/become_vendor.dart';
import 'package:stylclick/redirect.dart';
import 'package:stylclick/shared/app_providers.dart';
import 'package:stylclick/shared/constants/strings.dart';
import 'package:stylclick/shared/utils/helpers.dart';

SharedPreferences? sharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialize();

  // runApp(MultiProvider(
  //   providers: appProviders,
  //   child: const MyApp(),
  // ));

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool moveToOnboarding = false;
  bool moveToHome = true;

  void load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      moveToHome = prefs.getBool('home') ?? false;
      moveToOnboarding = (prefs.getBool('onboarding') ?? true);
    });
  }

  @override
  void initState() {
    load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return ScreenUtilInit(
      designSize: Size(logicalWidth(), logicalHeight()),
      builder: (BuildContext context, Widget? child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        scrollBehavior: SBehavior(),
        title: appName,
        home: HomePage(),
        // home: moveToHome
        //     ? Redirect()
        //     : moveToOnboarding
        //         ? BeepWalkThrough()
        //         : Login(),
        // onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
