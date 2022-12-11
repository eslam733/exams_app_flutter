import 'package:exams_app_flutter/helpers/colors_data.dart';
import 'package:exams_app_flutter/providers/multi_providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'pages/splash/provider/splash_helper.dart';
import 'pages/splash/view/splash_screen.dart';
import 'pages/welcome_page/view/welcome_screen.dart';
import 'providers/firebase_login_provider.dart';
import 'providers/google_provider.dart';
import 'providers/public_providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: providers, child: const Exams()));
}

class Exams extends StatelessWidget {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  const Exams({super.key});

  @override
  Widget build(BuildContext context) {
    PublicProviders.googleLoginProvider = Provider.of<GoogleProvider>(
      context,
    );
    PublicProviders.firebaseLoginProvider = Provider.of<FirebaseLoginProvider>(
      context,
    );
    PublicProviders.splashProvider = Provider.of<SplashProvider>(
      context,
    );
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, _) {
          return MaterialApp(
            navigatorKey: Exams.navigatorKey,
            debugShowCheckedModeBanner: false,
            title: 'Exams',
            theme: ThemeData(
              fontFamily: "Cairo",
              primaryColor: pinkColor,
              scaffoldBackgroundColor: white,
              brightness: Brightness.light,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              dividerColor: greyColor,
              appBarTheme: AppBarTheme(
                backgroundColor: pinkColor,
                elevation: 0,
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarBrightness: Brightness.light,
                  statusBarIconBrightness: Brightness.dark,
                ),
                iconTheme: IconThemeData(color: pinkDarkColor),
              ),
              cardColor: Colors.white,
              backgroundColor: white,
              iconTheme:
                  const IconThemeData(color: Color(0xFF808080), size: 30),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: Colors.black.withOpacity(0.0),
                  elevation: 0,
                  selectedItemColor: pinkDarkColor,
                  type: BottomNavigationBarType.fixed,
                  // elevation: 10.0,
                  unselectedItemColor: Colors.grey,
                  showUnselectedLabels: true,
                  unselectedLabelStyle: const TextStyle(color: Colors.grey)),
            ),
            home: const SplashScreen(),
               builder: EasyLoading.init(),
          );
        });
  }
}
