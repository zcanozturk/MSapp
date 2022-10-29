import 'package:flutter/material.dart';
import 'package:MSapp/view/home/model/home_model.dart';
import 'package:MSapp/view/home/service/home_service.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  final IHomeService homeService;
  HomeViewModel(this.homeService);

  var counter = 0.obs;
  var isLoading = false.obs;
  var homeList = <HomeModel>[].obs;

  void increaseCounter() => counter++;

  void changeLoading() {
    isLoading.value = !isLoading.value;
  }

  Future<void> getHomeItems() async {
    changeLoading();

    final response = await homeService.fetchHomeItems();

    //this response handle algo can be better than
    if (response.isNotEmpty) {
      homeList.value = response;
      Get.snackbar(
        "Success",
        'You have items !',
      );
    } else {
      Get.snackbar('Error', 'Some errors happened OR There is no item !');
    }

    changeLoading();
  }
}
