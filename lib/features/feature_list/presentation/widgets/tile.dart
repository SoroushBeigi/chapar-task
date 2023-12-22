import 'package:chapar_task/core/utils/constants.dart';
import 'package:chapar_task/features/feature_list/domain/entities/delivery.dart';
import 'package:chapar_task/features/feature_list/presentation/bloc/list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Tile extends StatelessWidget {
  final Delivery delivery;
  const Tile({required this.delivery, super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListTile(
        onTap: () {},
        title: Text(delivery.receiver!.fullName ?? Constants.unknown),
        subtitle: Text(
            delivery.receiverAddress!.fullAddress ?? Constants.unknownAddress),
        trailing: IconButton(
            onPressed: () => BlocProvider.of<ListBloc>(context)
                .add(CallEvent(phoneNumber: delivery.receiver!.mobile!)),
            icon: const Icon(Icons.call)),
      ),
    );
  }
}
