import 'package:flutter_template_simple/view/login/model/login.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel extends INetworkModel<LoginResponseModel> {
  bool? hasError;
  String? errorMessage;
  Login? responseData;
  
  LoginResponseModel({this.hasError , this.errorMessage, this.responseData});

  @override
  LoginResponseModel fromJson(Map<String, dynamic> json) {
    return _$LoginResponseModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$LoginResponseModelToJson(this);
  }
}
