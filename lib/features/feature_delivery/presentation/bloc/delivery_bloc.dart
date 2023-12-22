
import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:map_launcher/map_launcher.dart';

part 'delivery_event.dart';
part 'delivery_state.dart';

class DeliveryBloc extends Bloc<DeliveryEvent, DeliveryState> {
  DeliveryBloc() : super(DeliveryInitial()) {
    on<NavigationEvent>(_navigate);
    on<CallEvent>(_call);
  }

  Future<void> _navigate(NavigationEvent event, Emitter<DeliveryState> emit)async {
  final availableMaps = await MapLauncher.installedMaps;
   await availableMaps.first.showMarker(
  coords: Coords(event.lat, event.long),
  title: "Ocean Beach",
);
  }

  Future<void> _call(CallEvent event, Emitter<DeliveryState> emit)async {
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
