import 'package:chapar_task/features/feature_delivery/presentation/bloc/delivery_bloc.dart';
import 'package:chapar_task/injections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeliveryScreen extends StatelessWidget {
  final String title;
  const DeliveryScreen({required this.title,super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<DeliveryBloc>(),
      child: _DeliveryScreen(title: title),
    );
  }
}

class _DeliveryScreen extends StatefulWidget {
  final String title;
  const _DeliveryScreen({required this.title});

  @override
  State<_DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<_DeliveryScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Align(alignment: Alignment.centerRight,child: Text(widget.title)),),
    );
  }
}
