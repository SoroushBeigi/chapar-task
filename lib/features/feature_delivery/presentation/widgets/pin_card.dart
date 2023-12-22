import 'package:chapar_task/core/utils/constants.dart';
import 'package:chapar_task/core/utils/theme.dart';
import 'package:chapar_task/features/feature_delivery/presentation/widgets/pin_input.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PinCard extends StatelessWidget {
  final TextEditingController controller;
  const PinCard({required this.controller, super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 27.h,
      decoration: AppTheme.boxDecoration,
      padding: EdgeInsets.all(5.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(Constants.codeInputText),
          PinInput(controller: controller),
          SizedBox(
            width: 30.w,
            child: ElevatedButton(
                onPressed: () => context.pop(),
                child: Text(
                  Constants.submitCodeButton,
                  style: AppTheme.lightTheme.textTheme.displaySmall,
                )),
          )
        ],
      ),
    );
  }
}
