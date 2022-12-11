
import 'package:exams_app_flutter/main.dart';

import '../pages/splash/provider/splash_helper.dart';
import 'firebase_login_provider.dart';
import 'google_provider.dart';

class PublicProviders {
  static FirebaseLoginProvider firebaseLoginProvider = FirebaseLoginProvider();
  static SplashProvider splashProvider = SplashProvider();
  static GoogleProvider googleLoginProvider = GoogleProvider();

}
