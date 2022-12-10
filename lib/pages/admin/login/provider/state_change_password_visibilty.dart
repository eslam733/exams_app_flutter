
import 'package:provider/provider.dart';

import 'login_admin_helper.dart';

class StateChangePasswordVisibilty {
  LoginAdminProvider loginAdminProvider = LoginAdminProvider();
  StateChangePasswordVisibilty(context) {
    loginAdminProvider = Provider.of<LoginAdminProvider>(context, listen: false);
  }

  visibityClick() {
    loginAdminProvider.changePasswordVisiabltiy();
  }
}
