// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:chapar_task/features/feature_list/domain/entities/delivery.dart';

class DeliveryModel extends Delivery {
  DeliveryModel({
    super.id,
    super.status,
    super.isCod,
    super.receiver,
    super.receiverAddress,
  });

  factory DeliveryModel.fromJson(Map<String, dynamic> json) {
    return DeliveryModel(
      id: json["id"],
      status: json["status"],
      isCod: json["is_cod"],
      receiver:
          json["receiver"] == null ? null : Receiver.fromJson(json["receiver"]),
      receiverAddress: json["receiver_address"] == null
          ? null
          : ReceiverAddress.fromJson(json["receiver_address"]),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["status"] = status;
    _data["is_cod"] = isCod;
    if (receiver != null) {
      _data["receiver"] = receiver?.toJson();
    }
    if (receiverAddress != null) {
      _data["receiver_address"] = receiverAddress?.toJson();
    }
    return _data;
  }
}

class ReceiverAddress {
  String? city;
  String? region;
  String? fullAddress;

  ReceiverAddress({this.city, this.region, this.fullAddress});

  ReceiverAddress.fromJson(Map<String, dynamic> json) {
    if (json["city"] is String) {
      city = json["city"];
    }
    if (json["region"] is String) {
      region = json["region"];
    }
    if (json["full_address"] is String) {
      fullAddress = json["full_address"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["city"] = city;
    _data["region"] = region;
    _data["full_address"] = fullAddress;
    return _data;
  }
}

class Receiver {
  String? gender;
  String? fullName;
  String? mobile;

  Receiver({this.gender, this.fullName, this.mobile});

  Receiver.fromJson(Map<String, dynamic> json) {
    if (json["gender"] is String) {
      gender = json["gender"];
    }
    if (json["full_name"] is String) {
      fullName = json["full_name"];
    }
    if (json["mobile"] is String) {
      mobile = json["mobile"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["gender"] = gender;
    _data["full_name"] = fullName;
    _data["mobile"] = mobile;
    return _data;
  }
}
