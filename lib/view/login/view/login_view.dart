import 'package:flutter/material.dart';
import 'package:flutter_template_simple/core/components/drawer/get_drawer.dart';
//import 'package:flutter_template_simple/core/components/appbar/app_bar.dart';
import 'package:flutter_template_simple/core/constants/app/app_constants.dart';
import 'package:flutter_template_simple/core/network/vexana_manager.dart';
import 'package:flutter_template_simple/view/login/service/login_service.dart';
import 'package:flutter_template_simple/view/login/viewmodel/login_view_model.dart';

import '../../../../core/extensions/context_extension.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final ctrl = Get.put(
      LoginViewModel(LoginService(VexanaManager.instance.networkManager)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: getDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('LOGIN'),
      ), //getAppBar('LOGIN'),
      body: buildObservableBody(context),
    );
  }

  buildObservableBody(BuildContext context) {
    return Obx(
        () => ctrl.isLoading.value ? buildCenterLoading() : buildBody(context));
  }

  buildCenterLoading() => Center(
        child: CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          backgroundColor: Colors.grey,
        ),
      );

  buildBody(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      alignment: Alignment.center,
      child: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [getHeadImage(), getFormFields(context), getDescription()],
      )),
    );
  }

  getHeadImage() {
    return Container(
        alignment: Alignment.center,
        width: Get.width * 0.9,
        height: Get.height * 0.3,
        child: Image.asset('assets/images/welcome.png'));
  }

  getFormFields(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: context.paddingNormal,
            child: TextFormField(
              maxLength: 11,
              controller: ctrl.usernameController,
              keyboardType: TextInputType.phone,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0.0),
                labelText: 'usernameInput'.tr,
                hintText: 'usernameInput'.tr,
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                ),
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.black,
                  size: 18,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                floatingLabelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.5),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 9) {
                  return 'emptyInputMessage'.tr;
                }
                print(value);
                // TODO ctrl.emailInput = value;
                return null;
              },
            ),
          ),
          Padding(
            padding: context.paddingNormalHorizontal,
            child: TextFormField(
              controller: ctrl.passwordController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0.0),
                labelText: 'passwordInput'.tr,
                hintText: 'passwordInput'.tr,
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                ),
                prefixIcon: Icon(
                  Icons.password,
                  color: Colors.black,
                  size: 18,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                floatingLabelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.5),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              obscureText: true,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'emptyInputMessage'.tr;
                }
                // TODO ctrl.passwordInput = value;
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                primary: Colors.blue,
                padding: context.paddingLow,
                minimumSize: Size(Get.width * 0.85, 50),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
              ),
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  Get.snackbar('Giriş Yapılıyor', 'Lütfen bekleyiniz',
                      colorText: Colors.white,
                      backgroundColor: Colors.blue,
                      duration: Duration(seconds: 3),
                      snackPosition: SnackPosition.TOP);
                  ctrl.sendLoginToAPI();
                }
              },
              child: Obx(() => ctrl.isLoading.value
                  ? Icon(Icons.watch_later_outlined)
                  : Text('loginTitle'.tr)),
            ),
          ),
        ],
      ),
    );
  }

  getDescription() {
    return ElevatedButton(
        onPressed: null, child: Text('v' + ApplicationConstants.appVersion));
  }
}
