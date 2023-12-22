import 'package:chapar_task/features/feature_list/data/models/delivery_model.dart';

class Delivery {
  final int? id;
  final String? status;
  final bool? isCod;
  final Receiver? receiver;
  final ReceiverAddress? receiverAddress;

  const Delivery(
      {required this.id,
      required this.status,
      required this.isCod,
      required this.receiver,
      required this.receiverAddress});
}
