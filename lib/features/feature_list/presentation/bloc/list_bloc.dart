import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:chapar_task/core/data_state.dart';
import 'package:chapar_task/core/utils/constants.dart';
import 'package:chapar_task/features/feature_list/domain/entities/delivery.dart';
import 'package:chapar_task/features/feature_list/domain/usecases/load_list_usecase.dart';
import 'package:chapar_task/features/feature_list/presentation/bloc/list_status.dart';
import 'package:url_launcher/url_launcher.dart';

part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  LoadListUsecase loadListUsecase;

  ListBloc({required this.loadListUsecase})
      : super(ListState(listStatus: ListLoading())) {
    on<LoadListEvent>(_loadList);
    on<CallEvent>(_call);
  }

  List<Delivery> deliveryList = [];

  Future<void> _loadList(LoadListEvent event, Emitter<ListState> emit) async {
    final dataState = await loadListUsecase(null);
    if (dataState is DataSuccess && dataState.data != null) {
      deliveryList = dataState.data!;
      emit(
          state.copyWith(newStatus: ListCompleted(deliveryList: deliveryList)));
    } else {
      emit(state.copyWith(newStatus: ListError(error: Constants.cantLoad)));
    }
  }

  Future<void> _call(CallEvent event, Emitter<ListState> emit) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: event.phoneNumber,
    );
    bool canCall = await canLaunchUrl(launchUri);
    if (canCall) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not call ${event.phoneNumber}';
    }
  }
}
