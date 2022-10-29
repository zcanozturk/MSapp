import 'package:flutter/material.dart';
//import 'package:MSapp/core/extensions/role_manager.dart';
import 'package:MSapp/view/home/view/home_view.dart';
import 'package:MSapp/view/login/model/login_model.dart';
import 'package:MSapp/view/login/service/login_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginViewModel extends GetxController {
  final ILoginService loginService;
  LoginViewModel(this.loginService);

  final box = GetStorage();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var isLoading = false.obs;

  changeLoading() {
    isLoading.value = !isLoading.value;
  }

  Future<void> sendLoginToAPI() async {
    changeLoading();
    final response = await loginService.sendLoginRequest(LoginModel(
        userName: usernameController.text, password: passwordController.text));

    if (response != null) {
      if (response.hasError == false) {
        if (response.responseData?.jwtToken != null) {
          box.write('jwt', response.responseData!.jwtToken);
          Get.offAll(HomeView());
          // var roleManager = RoleManager();
          // String role = roleManager.getRoleFromJwtParser(response.responseData!.jwtToken);
          // String accountId =
          //     roleManager.getAccountIdFromJwtParser(response.responseData!.jwtToken);
          // box.write('role', role);
          // box.write('id', accountId);
        }
      } else {
        Get.snackbar(
            "ERROR", response.errorMessage ?? "There are some errors happened",
            colorText: Colors.white,
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3));
      }
    } else {
      Get.snackbar('HATA', 'Tekrar kontrol edip deneyiniz!',
          colorText: Colors.white,
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3));
    }
    changeLoading();
  }
}
