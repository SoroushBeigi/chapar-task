import 'package:chapar_task/features/feature_login/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({int? status, String? token})
      : super(status: status, token: token);

  factory UserModel.fromJson(Map<String, dynamic> json, int status) =>
      UserModel(
        status: status,
        token: json['access_token'],
      );
}
