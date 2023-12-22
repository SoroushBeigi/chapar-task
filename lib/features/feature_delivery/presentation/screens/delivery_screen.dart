import 'package:chapar_task/features/feature_delivery/presentation/bloc/delivery_bloc.dart';
import 'package:chapar_task/injections.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeliveryScreen extends StatelessWidget {
  const DeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<DeliveryBloc>(),
      child: const DeliveryScreen(),
    );
  }
}

class _DeliveryScreen extends StatefulWidget {
  const _DeliveryScreen({super.key});

  @override
  State<_DeliveryScreen> createState() => __DeliveryScreenState();
}

class __DeliveryScreenState extends State<_DeliveryScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
