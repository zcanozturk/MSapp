import 'package:flutter/material.dart';
import 'package:get/get.dart';

getSnackbar(String title, String message, Color colorText, Color colorBack,
    int duration) {
  return Get.snackbar(
      title, message,
      colorText: colorText,
      backgroundColor: colorBack,
      duration: Duration(seconds: duration));
}
