part of 'delivery_bloc.dart';

sealed class DeliveryEvent {}

class NavigationEvent extends DeliveryEvent {
  final double lat;
  final double long;
  NavigationEvent({required this.lat, required this.long});
}

class CallEvent extends DeliveryEvent {
  final String phoneNumber;
  CallEvent({required this.phoneNumber});
}
