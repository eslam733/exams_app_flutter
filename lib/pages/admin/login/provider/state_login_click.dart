import 'package:exams_app_flutter/widgets/loader.dart';
import 'package:provider/provider.dart';

import 'login_admin_helper.dart';

class StateLoginClick {
  LoginAdminProvider loginAdminProvider = LoginAdminProvider();
  StateLoginClick(context) {
    loginAdminProvider =
        Provider.of<LoginAdminProvider>(context, listen: false);
  }

  login(context) {
    Loaders.startLoading(context);
    loginAdminProvider.login(context);
    Loaders.endLoading(context);
  }
}
