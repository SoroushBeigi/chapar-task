import 'package:chapar_task/core/data_state.dart';
import 'package:chapar_task/features/feature_list/domain/entities/delivery.dart';

abstract class ListRepository{
  Future<DataState<List<Delivery>>> loadList();
}