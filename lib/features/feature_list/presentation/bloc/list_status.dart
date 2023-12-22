import 'package:chapar_task/features/feature_list/domain/entities/delivery.dart';

abstract class ListStatus {}

class ListLoading extends ListStatus {}

class ListCompleted extends ListStatus {
  final List<Delivery> deliveryList;
  ListCompleted({required this.deliveryList});
}

class ListError extends ListStatus {
  final String error;
  ListError({required this.error});
}
