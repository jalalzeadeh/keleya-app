import 'package:keley_app/ApiManager/repository.dart';
import 'package:keley_app/models/BaseModel.dart';
import 'package:keley_app/models/User.dart';
import 'package:keley_app/extensions/string_extensions.dart';
import 'package:keley_app/providers/shared_preference_provider.dart';

class SignUpScreenModel extends BaseModel {
  String email = "";
  String password = "";
  String confirmPassword = "";
  bool showPassword = false;
  bool showConfirmPassword = false;
  bool acceptedTersm = false;
  bool acceptedPolicy = false;

  SignUpScreenModel();

  @override
  void dispose() {
    super.dispose();
  }

  void changePasswordType() {
    this.showPassword = !this.showPassword;
    notifyListeners();
  }

  void changeConfirmPasswordType() {
    this.showConfirmPassword = !this.showConfirmPassword;
    notifyListeners();
  }

  void toggleTermsType() {
    this.acceptedTersm = !this.acceptedTersm;
    notifyListeners();
  }

  void togglePolicyType() {
    this.acceptedPolicy = !this.acceptedPolicy;
    notifyListeners();
  }

  Future<bool> registerUser() async {
    this.toggleBusy();
    final user = User(id: 0,
        email: email,
        password: password,
        acceptedPrivacyPolicy: acceptedPolicy,
        acceptedTermsAndConditions: acceptedTersm);
    final success = await Repository().registerUser(user);
    if (success.data[0] == true) {
      User user = success.data[1];
      SharedPreferenceProvider().saveUser(user);
    }
    this.toggleBusy();
    return success.data[0];
  }

  bool canSendData() {
    if (email.isEmail &&
        password.length >= 6 &&
        password == confirmPassword &&
        acceptedTersm &&
        acceptedPolicy) {
      return true;
    } else {
      return false;
    }

    /// Here we can add some actions like enable/disable 'sign up' button.
  }
}
