import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'register_model.g.dart';

@JsonSerializable()
class registerModel extends INetworkModel<registerModel> {
  int? userId;
  int? id;
  String? title;
  String? body;

  registerModel({this.userId, this.id, this.title, this.body});

  @override
  registerModel fromJson(Map<String, dynamic> json) {
    return _$registerModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$registerModelToJson(this);
  }
}
