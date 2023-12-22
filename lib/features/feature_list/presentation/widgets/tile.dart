import 'package:chapar_task/core/utils/constants.dart';
import 'package:chapar_task/core/utils/theme.dart';
import 'package:chapar_task/features/feature_list/domain/entities/delivery.dart';
import 'package:chapar_task/features/feature_list/presentation/bloc/list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Tile extends StatelessWidget {
  final Delivery delivery;
  const Tile({required this.delivery, super.key});

  @override
  Widget build(BuildContext context) {
    final bool isCod = delivery.isCod ?? false;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListTile( 
        contentPadding: EdgeInsets.all(2.w),
        splashColor: Colors.white,
        onTap: ()=>context.push('/delivery',extra: delivery),
        title: Text(delivery.receiver!.fullName ?? Constants.unknown),
        subtitle: Text(
            delivery.receiverAddress!.fullAddress ?? Constants.unknownAddress),
        leading: isCod
            ? Icon(
                Icons.money,
                color: AppTheme.lightTheme.primaryColor,
              )
            : Icon(
                Icons.credit_card,
                color: AppTheme.lightTheme.primaryColor,
              ),
        trailing: IconButton(
            onPressed: () => BlocProvider.of<ListBloc>(context)
                .add(CallEvent(phoneNumber: delivery.receiver!.mobile!)),
            icon: Icon(
              Icons.call,
              color: AppTheme.lightTheme.primaryColorDark,
            )),
      ),
    );
  }
}
