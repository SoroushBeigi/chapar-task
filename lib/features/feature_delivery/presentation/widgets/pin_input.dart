import 'package:chapar_task/core/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinInput extends StatelessWidget {
  final TextEditingController controller;
  const PinInput({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Pinput(
      controller: controller,
      androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
      listenForMultipleSmsOnAndroid: true,
      defaultPinTheme: AppTheme.pinTheme,
      hapticFeedbackType: HapticFeedbackType.lightImpact,
      onCompleted: (pin) {
        debugPrint('onCompleted: $pin');
      },
      onChanged: (value) {
        debugPrint('onChanged: $value');
      },
      cursor: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 9),
            width: 22,
            height: 1,
            color: AppTheme.lightTheme.primaryColorDark,
          ),
        ],
      ),
      focusedPinTheme: AppTheme.pinTheme.copyWith(
        decoration: AppTheme.pinTheme.decoration!.copyWith(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppTheme.lightTheme.primaryColorDark),
        ),
      ),
      submittedPinTheme: AppTheme.pinTheme.copyWith(
        decoration: AppTheme.pinTheme.decoration!.copyWith(
          color: Colors.white,
          borderRadius: BorderRadius.circular(19),
          border: Border.all(color: AppTheme.lightTheme.primaryColorDark),
        ),
      ),

    );
  }
}
