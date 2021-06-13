import 'package:keley_app/ApiManager/repository.dart';
import 'package:keley_app/models/BaseModel.dart';
import 'package:keley_app/models/User.dart';
import 'package:keley_app/providers/shared_preference_provider.dart';


class NameScreenModel extends BaseModel {

  String name = "";
  var user = User();

  NameScreenModel() {
    getUserFromCache();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getUserFromCache() async {
    final item = await SharedPreferenceProvider().getUser();
    if (item != null) {
      user = item;
    }
  }

  Future<bool> updateUser() async {
    user.name = name;
    this.toggleBusy();
    final success = await Repository().updateUser(User() );
    if (success.data[0] == true) {
      User user = success.data[1];
      SharedPreferenceProvider().saveUser(user);
    }
    this.toggleBusy();
    return success.data[0];
  }


}