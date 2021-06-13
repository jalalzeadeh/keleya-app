import 'package:keley_app/ApiManager/repository.dart';
import 'package:keley_app/models/BaseModel.dart';
import 'package:keley_app/models/User.dart';
import 'package:keley_app/providers/shared_preference_provider.dart';


class DateScreenModel extends BaseModel {
  String email = "";
  String password = "";
  bool showPassword = false;
  bool showCaleendar = false;
  var selectedDay = DateTime.now();
  var user = User();

  DateScreenModel() {
    getUserFromCache();
  }

  void getUserFromCache() async {
    final item = await SharedPreferenceProvider().getUser();
    if (item != null) {
      user = item;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  void upDateSelectedDate(DateTime selected) {
    this.selectedDay = selected;
    this.showCaleendar = false;
    notifyListeners();
  }

  void toggleCalendar(){
    this.showCaleendar = !this.showCaleendar;
    notifyListeners();
  }


  /// update user action
  Future<bool> updateUser() async {
    this.toggleBusy();
    /// call update user api
    user.babyBirthDate = selectedDay.toUtc().toString();
    final success = await Repository().updateUser(user);
    if (success.data[0] == true) {
      User user = success.data[1];
      SharedPreferenceProvider().saveUser(user);
    }
    this.toggleBusy();
    return success.data[0];
  }


}