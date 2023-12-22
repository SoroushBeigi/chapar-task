import 'package:chapar_task/features/feature_login/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({super.status, super.token});

  factory UserModel.fromJson(Map<String, dynamic> json, int status) =>
      UserModel(
        status: status,
        token: json['access_token'],
      );
}
