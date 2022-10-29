import 'package:flutter_template_simple/core/constants/app/app_constants.dart';
import 'package:flutter_template_simple/core/network/network_helper.dart';
import 'package:flutter_template_simple/view/login/model/login_model.dart';
import 'package:flutter_template_simple/view/login/model/login_response_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vexana/vexana.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ILoginService {
  INetworkManager networkManager;
  ILoginService(this.networkManager);

  Future<LoginResponseModel?> sendLoginRequest(LoginModel model);
}

class LoginService extends ILoginService with NetworkHelper {
  LoginService(INetworkManager networkManager) : super(networkManager);
  final box = GetStorage();

  @override
  Future<LoginResponseModel?> sendLoginRequest(LoginModel model) async {
    final response = await networkManager
        .send<LoginResponseModel, LoginResponseModel>(
            ApplicationConstants.appAuthURL + '/your-login-path',
            parseModel: LoginResponseModel(),
            method: RequestType.POST, //GET,PUT,DELETE
            data: model
            // queryParameters: Map.fromEntries([
            //   MapEntry('accountId', box.read('id')),
            //   MapEntry('branchId', box.read('branchId')),
            // ]),
            // options: Options(
            //     headers: {'Authorization': 'Bearer ' + box.read('jwt')}) // raw jwt could be enum or sth else
            );
    if (response.error != null) {
      Get.snackbar("ERROR",
          response.error?.description ?? 'There are some errors happened !');
      if (response.error!.statusCode == 401) {
        //Get.offAll(LoginView());
      }
    }

    return response.data;
  }
}
