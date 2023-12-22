import 'package:chapar_task/core/utils/constants.dart';
import 'package:chapar_task/core/utils/persian_numbers.dart';
import 'package:chapar_task/core/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DetailCard extends StatelessWidget {
  final bool isFemale;
  final String phoneNumber;
  const DetailCard(
      {required this.isFemale, required this.phoneNumber, super.key});

  @override
  Widget build(BuildContext context) {
    final persianPhoneNumber = PersianNumbers.convertEnToFa(phoneNumber); 
    return Container(
        width: 80.w,
        decoration: AppTheme.boxDecoration,
        padding: EdgeInsets.all(5.w),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    isFemale
                        ? const Icon(
                            Icons.female,
                            color: Colors.pink,
                          )
                        : const Icon(
                            Icons.male,
                            color: Colors.blue,
                          ),
                    Text(isFemale ? Constants.female : Constants.male)
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.phone,
                      color: Colors.blue,
                    ),
                    Text(persianPhoneNumber)
                  ],
                )
              ],
            )
          ],
        ));
  }
}
