
import 'package:json_annotation/json_annotation.dart';
part 'login.g.dart';

@JsonSerializable()
class Login {
  
  int? id;
  String? title;
  String? firstName;
  String? lastName;
  String? userName;
  String? role;
  String? created;
  String? updated;
  bool? isVerified;
  String? jwtToken;

  Login(
      {this.id,
      this.title,
      this.firstName,
      this.lastName,
      this.userName,
      this.role,
      this.created,
      this.updated,
      this.isVerified,
      this.jwtToken});
 
 factory Login.fromJson(Map<String, dynamic> json) =>
      _$LoginFromJson(json);
  Map<String, dynamic> toJson() => _$LoginToJson(this);

}