import 'package:chapar_task/core/data_state.dart';
import 'package:chapar_task/core/usecase/usecase.dart';
import 'package:chapar_task/features/feature_list/domain/entities/delivery.dart';
import 'package:chapar_task/features/feature_list/domain/repository/list_repository.dart';

class LoadListUsecase extends Usecase<DataState<List<Delivery>>, bool?> {
  final ListRepository listRepository;
  LoadListUsecase({required this.listRepository});
  @override
  Future<DataState<List<Delivery>>> call(bool? param) =>
      listRepository.loadList();
}
