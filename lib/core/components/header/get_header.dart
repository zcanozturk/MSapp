import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

getHeader(String title) {
  return Container(
    margin: EdgeInsets.symmetric(vertical : Get.width * 0.05),
    alignment: Alignment.center,
    width: Get.width,
    child : AutoSizeText(title,
    maxLines: 1,
    )
  );
}
