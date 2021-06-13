import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:keley_app/ApiManager/urls.dart';
import 'package:keley_app/ApiManager/api_response.dart';
import 'package:keley_app/models/User.dart';
import 'package:http/http.dart' as http;

class ApiProvider {

  static const PAGING_LIMIT = 20;
  static const PAGING_LIMIT_CLIENTS = 10;


  /// create user
  Future<ApiResponse> createUser(User user) async {
    print('${Uri.parse(URLs.authenticatesURL)} ${user.email} ${user.password}');
    final response = await http.post(
      Uri.parse(URLs.createUserURL),
      headers: <String, String>{
      },
      body: jsonEncode(<String, String>{
        'email': user.email ?? '',
        'password': user.password ?? '',
        'acceptedTermsAndConditions': '${user.acceptedTermsAndConditions ?? false}',
        'acceptedPrivacyPolicy': '${user.acceptedPrivacyPolicy ?? false}',
      }),
    );
    if (response.statusCode == 200) {
      print('body: ${response.body}');
      User? user;
      if (response.body.contains("user:")){
        final parsed = json.decode(response.body);
        user = User.fromJson(parsed['user:']);
      }
      return ApiResponse(code: 200, data: [user != null ? true : false, user]);
    } else {
      print('body_ERROR: ${response.body}');
      return ApiResponse(code: 500, data: [false, null]);
     // throw Exception('Unable to fetch products from the REST API');
    }
  }

  /// update user
  Future<ApiResponse> updateUser(User  user) async {
    final response = await http.patch(
      Uri.parse(URLs.createUserURL),
      headers: <String, String>{
      },
      body: jsonEncode(<String, String>{
        'email': '',
        'password': ''
      }),
    );
    if (response.statusCode == 200) {
      print('body: ${response.body}');
      User? user;
      if (response.body.contains("user:")){
        final parsed = json.decode(response.body);
        user = User.fromJson(parsed['user:']);
      }
      return ApiResponse(code: 200, data: [user != null ? true : false, user]);
    } else {
      return ApiResponse(code: 500, data: [false, null]);
      // throw Exception('Unable to fetch products from the REST API');
    }
  }

  /// check login
  Future<ApiResponse> authUser(String email, String password) async {
    print('${Uri.parse(URLs.authenticatesURL)} ${email} ${password}');
    final response = await http.post(
      Uri.parse(URLs.authenticatesURL),
      headers: <String, String>{
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password
      }),
    );
    if (response.statusCode == 200) {
      print('body: ${response.body}');
      User? user;
      if (response.body.contains("user:")){
        final parsed = json.decode(response.body);
        user = User.fromJson(parsed['user:']);
      }
      return ApiResponse(code: 200, data: [user != null ? true : false, user]);
    } else {
      print('body_ERROR: ${response.body}');
      return ApiResponse(code: 500, data: [false, null]);
      // throw Exception('Unable to fetch products from the REST API');
    }
  }
  //
  //
  //
  //
  //
  // Future<ApiResponse> enrollCourse(String courseId, String token) async {
  //   final response = await http.post(
  //     URLs.enrollCourseURL,
  //     headers: <String, String>{
  //       'token': token
  //     },
  //     body: jsonEncode(<String, String>{
  //       'courseId': courseId,
  //     }),
  //   );
  //   print('body: ${response.body}');
  //   if (response.statusCode == 200) {
  //
  //     // User user;
  //     // if (response.body.contains("user:")){
  //     //   final parsed = json.decode(response.body);
  //     //   user = User.fromJson(parsed['user:']);
  //     // }
  //     return ApiResponse.completed(true);
  //   } else {
  //     return ApiResponse.completed(false);
  //    // throw Exception('Unable to fetch products from the REST API');
  //   }
  // }




}
