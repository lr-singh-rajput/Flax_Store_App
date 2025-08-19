import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
    // Observable to track login status

  @override



  // Save the login status to SharedPreferences
  Future<void> setLoginStatus(bool isLogin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('is_login', isLogin);
    if(isLogin == false){
      prefs.clear();
    }

  }


  // Load the login status from SharedPreferences
  Future<bool> getLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
   return  prefs.getBool("is_login") ?? false;
  }

}