import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  RxBool isDark = false.obs;  // Observable variable to track the theme.

  @override
  void onInit() {
    super.onInit();
    _loadThemePreference();

  }

  // Load the theme preference from SharedPreferences.
  _loadThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isDark.value = prefs.getBool('isDark') ?? false;
  }

  // Toggle the theme and save the preference.
  void toggleTheme() async {
    isDark.value = !isDark.value;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDark', isDark.value);
  }



}
