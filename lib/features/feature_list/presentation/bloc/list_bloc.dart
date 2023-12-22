import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:chapar_task/features/feature_list/domain/usecases/load_list_usecase.dart';

part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  LoadListUsecase loadListUsecase;

  ListBloc({required this.loadListUsecase}) : super(ListInitial()) {
    on<LoadListEvent>(_loadList);
  }

  Future<void> _loadList(LoadListEvent event, Emitter<ListState> emit) async {
    final dataState = await loadListUsecase(null);
    
  }
}
