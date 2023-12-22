import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'delivery_event.dart';
part 'delivery_state.dart';

class DeliveryBloc extends Bloc<DeliveryEvent, DeliveryState> {
  DeliveryBloc() : super(DeliveryInitial()) {
    on<DeliveryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
