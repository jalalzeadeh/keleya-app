import 'package:keley_app/ApiManager/repository.dart';
import 'package:keley_app/models/BaseModel.dart';
import 'package:keley_app/models/User.dart';
import 'package:keley_app/extensions/string_extensions.dart';
import 'package:keley_app/providers/shared_preference_provider.dart';


class SignInScreenModel extends BaseModel {
  String email = "";
  String password = "";
  bool showPassword = false;
  //bool isKeyboardVisible = false;

  SignInScreenModel();

  @override
  void dispose() {
    super.dispose();
  }

  void changePasswordType() {
    this.showPassword = !this.showPassword;
    notifyListeners();
  }

  Future<bool> checkLogin() async {
    this.toggleBusy();
    final success = await Repository().loginUser(this.email, this.password);
    if (success.data[0] == true) {
      User user = success.data[1];
      SharedPreferenceProvider().saveUser(user);
    }
    this.toggleBusy();
    return success.data[0];
  }

  bool canSendData(){
    if (email.isEmail && password.length >= 6){
      return true;
    } else{
      return false;
    }
    /// Here we can add some actions like enable/disable 'sign in' button.
  }



}