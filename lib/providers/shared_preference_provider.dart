import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:keley_app/models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceProvider {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final String userNameCashKey = "userNameKey";
  final String userCashKey = "userKey";

  saveUserName(String value) async {
    SharedPreferences prefs = await _prefs;
    prefs.setString(userNameCashKey, value);
  }

  getUserName() async {
    SharedPreferences prefs = await _prefs;
    return prefs.getString(userNameCashKey);
  }

  saveUser(User item) async {
    final value = json.encode(item.toJson());
    saveStringToDisk(userCashKey, value);
  }

  Future<User?> getUser() async {
    var userJson = await _getFromDisk(userCashKey);
    if (userJson == null) {
      return null;
    }
    return User.fromJson(json.decode(userJson));
  }

  removeUser() {
    removeStringToDisk(userCashKey);
  }

  Future<String> _getFromDisk(String key) async {
    SharedPreferences prefs = await _prefs;
    var value = prefs.getString(key);
    return value ?? '';
  }

  void saveStringToDisk(String keyString, String content) async{
    SharedPreferences prefs = await _prefs;
    prefs.setString(keyString, content);
  }

  void removeStringToDisk(String keyString) async{
    SharedPreferences prefs = await _prefs;
    prefs.remove(keyString);
  }


}