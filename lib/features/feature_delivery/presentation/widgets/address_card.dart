import 'package:chapar_task/core/utils/persian_numbers.dart';
import 'package:chapar_task/core/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddressCard extends StatelessWidget {
  final String address;
  const AddressCard({required this.address, super.key});

  @override
  Widget build(BuildContext context) {
    final modifiedAddress = PersianNumbers.convertEnToFa(address);
    return Container(
      width: 80.w,
      decoration: AppTheme.boxDecoration,
      padding: EdgeInsets.all(5.w),
      child: Text(
        'نشانی: $modifiedAddress',
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
