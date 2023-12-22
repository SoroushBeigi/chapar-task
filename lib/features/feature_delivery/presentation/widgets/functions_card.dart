import 'package:chapar_task/core/utils/constants.dart';
import 'package:chapar_task/core/utils/theme.dart';
import 'package:chapar_task/features/feature_delivery/presentation/bloc/delivery_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FunctionsCard extends StatelessWidget {
  final String phoneNumber;
  final bool isCod;
  const FunctionsCard({required this.phoneNumber,required this.isCod, super.key});

  @override
  Widget build(BuildContext context) {
    
    final bloc = BlocProvider.of<DeliveryBloc>(context);
    return Container(
      width: 80.w,
      height: 20.h,
      decoration: AppTheme.boxDecoration,
      padding: EdgeInsets.all(5.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            isCod
                ? Constants.isCodMessage
                : Constants.isNotCodMessage,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            style: AppTheme.lightTheme.textTheme.bodyLarge,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 30.w,
                child: ElevatedButton(
                  onPressed: () =>
                      bloc.add(CallEvent(phoneNumber: phoneNumber)),
                  child: const Text(Constants.callButton),
                ),
              ),
              SizedBox(
                width: 30.w,
                child: ElevatedButton(
                  //We don't have lat and lang in API, so I use mock data here.
                  onPressed: () =>
                      bloc.add(NavigationEvent(lat: 35.70884, long: 51.21253)),
                  child: const Text(Constants.navigationButton),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
