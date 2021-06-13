import 'package:keley_app/models/BaseModel.dart';


class SuccessScreenModel extends BaseModel {
  String email = "";
  String password = "";
  bool showPassword = false;

  SuccessScreenModel();

  @override
  void dispose() {
    super.dispose();
  }

  void changePasswordType() {
    this.showPassword = !this.showPassword;
    notifyListeners();
  }


}