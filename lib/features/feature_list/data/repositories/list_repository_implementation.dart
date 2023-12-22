import 'package:chapar_task/core/data_state.dart';
import 'package:chapar_task/features/feature_list/data/models/delivery_model.dart';
import 'package:chapar_task/features/feature_list/data/sources/remote/list_api_provider.dart';
import 'package:chapar_task/features/feature_list/domain/entities/delivery.dart';
import 'package:chapar_task/features/feature_list/domain/repository/list_repository.dart';
import 'package:chapar_task/core/services/storage_service.dart';

class ListRepositoryImplementation extends ListRepository {
  final ListApiProvider apiProvider;
  final StorageService storageService;
  ListRepositoryImplementation(
      {required this.apiProvider, required this.storageService});

  @override
  Future<DataState<List<Delivery>>> loadList() async {
    String? token = await storageService.readToken();
    if (token != null) {
      final response = await apiProvider.loadList(token);
      final List data = response['data'];
      final List<Delivery> deliveryList =
          data.map((e) => DeliveryModel.fromJson(e)).toList();
      return DataSuccess(deliveryList);
    } else {
      return const DataFailed('No token found');
    }
  }
}
