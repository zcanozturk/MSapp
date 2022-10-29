import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'base_response_model.g.dart';

@JsonSerializable()
class BaseResponseModel extends INetworkModel<BaseResponseModel> {
  bool? hasError;
  String? errorMessage;
  Object? responseData;

  BaseResponseModel({this.hasError, this.errorMessage, this.responseData});

  @override
  BaseResponseModel fromJson(Map<String, dynamic> json) {
    return _$BaseResponseModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$BaseResponseModelToJson(this);
  }
}