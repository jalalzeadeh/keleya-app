import 'package:keley_app/models/BaseModel.dart';


class InitialScreenModel extends BaseModel {
  String email = "";
  String password = "";
  bool showPassword = false;

  InitialScreenModel();


  @override
  void dispose() {
    super.dispose();
  }

  // void saveName(){
  //   SharedPreferenceProvider().saveUserName(this.name);
  // }
  //
  // void readName() async {
  //   this.name = await SharedPreferenceProvider().getUserName();
  //   notifyListeners();
  // }

  // void changePasswordType() {
  //   this.showPassword = !this.showPassword;
  //   notifyListeners();
  // }

  // Future<bool> checkLogin() async {
  //   this.toggleBusy();
  //   final success = await Repository().checkLogin(this.email, this.password);
  //   if (success.data[0] == true) {
  //     User user = success.data[1];
  //     SharedPreferenceProvider().saveUser(user);
  //   }
  //   this.toggleBusy();
  //   return success.data[0];
  // }
}