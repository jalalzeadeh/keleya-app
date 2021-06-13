import 'package:keley_app/ApiManager/api_provider.dart';
import 'package:keley_app/ApiManager/api_response.dart';
import 'package:keley_app/models/User.dart';
import 'package:logging/logging.dart';



class Repository {
  Logger _logger = Logger("Repository");

  ApiProvider _apiProvider;
  //LocalStorageProvider _localStorageProvider;

  // // private constructor + static instance + factory = singleton
  // factory Repository() => instance;
  //
  // Repository._constructor(this._apiProvider, this.preferencesController);
  //
  // static final Repository instance =
  // Repository._constructor(ApiProvider(), PreferencesController());



  // private constructor + static instance + factory = singleton
  factory Repository() => instance;

  Repository._constructor(this._apiProvider);

  static final Repository instance =
  Repository._constructor(ApiProvider());



  // String get accessToken => _localStorageProvider.accessToken;
  //
  // AppUser get appUser => _localStorageProvider.appUser;
  //
  // bool get cachedNeverAskCalendar => _localStorageProvider.neverSyncCalendar;
  //
  // bool get syncCalendarActive => _localStorageProvider.syncCalendarActive;


  Future<ApiResponse> loginUser(String email, String pass) async =>
      await _apiProvider.authUser(email, pass);

  Future<ApiResponse> registerUser(User user) async =>
      await _apiProvider.createUser(user);

  Future<ApiResponse> updateUser(User user) async =>
      await _apiProvider.updateUser(user);



}

