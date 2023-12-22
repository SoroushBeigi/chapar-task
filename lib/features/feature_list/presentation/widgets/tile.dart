import 'package:chapar_task/core/utils/constants.dart';
import 'package:chapar_task/core/utils/persian_numbers.dart';
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
    final address = PersianNumbers.convertEnToFa(delivery.receiverAddress!.fullAddress ?? Constants.unknownAddress);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListTile( 
        contentPadding: EdgeInsets.all(2.w),
        splashColor: Colors.white,
        onTap: ()=>context.push('/delivery',extra: delivery),
        title: Text(delivery.receiver!.fullName ?? Constants.unknown,style: AppTheme.lightTheme.textTheme.headlineMedium,),
        subtitle: Text(
            address,textAlign: TextAlign.justify,),
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
              size: 8.w,
              color: AppTheme.lightTheme.primaryColorDark,
            )),
      ),
    );
  }
}
