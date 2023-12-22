import 'package:chapar_task/core/utils/constants.dart';
import 'package:chapar_task/core/utils/theme.dart';
import 'package:chapar_task/features/feature_delivery/presentation/bloc/delivery_bloc.dart';
import 'package:chapar_task/features/feature_delivery/presentation/widgets/pin_input.dart';
import 'package:chapar_task/features/feature_list/domain/entities/delivery.dart';
import 'package:chapar_task/injections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DeliveryScreen extends StatelessWidget {
  final Delivery delivery;
  const DeliveryScreen({required this.delivery, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<DeliveryBloc>(),
      child: _DeliveryScreen(delivery: delivery),
    );
  }
}

class _DeliveryScreen extends StatefulWidget {
  final Delivery delivery;
  const _DeliveryScreen({required this.delivery});

  @override
  State<_DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<_DeliveryScreen> {
  late final TextEditingController inputController;

  @override
  void initState() {
    inputController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final delivery = widget.delivery;
    final textTheme = AppTheme.lightTheme.textTheme;
    final isFemale = delivery.receiver!.gender == 'f';
    final bloc = BlocProvider.of<DeliveryBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.lightTheme.primaryColorDark,
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            delivery.receiver!.fullName ?? Constants.unknown,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Container(
                  width: 80.w,
                  height: 27.h,
                  decoration: AppTheme.boxDecoration,
                  padding: EdgeInsets.all(5.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(Constants.codeInputText),
                      PinInput(controller: inputController),
                      SizedBox(
                        width: 30.w,
                        child: ElevatedButton(
                            onPressed: () {},
                            child: const Text(Constants.submitCodeButton)),
                      )
                    ],
                  ),
                ),
                 SizedBox(
                  height: 5.h,
                ),
                Container(
                  width: 80.w,
                  decoration: AppTheme.boxDecoration,
                  padding: EdgeInsets.all(5.w),
                  child: Text('نشانی: ${delivery.receiverAddress!.fullAddress!}',textDirection: TextDirection.rtl,),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Container(
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
                                Text(isFemale
                                    ? Constants.female
                                    : Constants.male)
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.phone,
                                  color: Colors.blue,
                                ),
                                Text(delivery.receiver!.mobile!)
                              ],
                            )
                          ],
                        )
                      ],
                    )),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  width: 80.w,
                  height: 20.h,
                  decoration: AppTheme.boxDecoration,
                  padding: EdgeInsets.all(5.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        delivery.isCod == true
                            ? Constants.isCodMessage
                            : Constants.isNotCodMessage,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        style: textTheme.bodyLarge,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 30.w,
                            child: ElevatedButton(
                              onPressed: () => bloc.add(CallEvent(
                                  phoneNumber: delivery.receiver!.mobile!)),
                              child: const Text(Constants.callButton),
                            ),
                          ),
                          SizedBox(
                            width: 30.w,
                            child: ElevatedButton(
                              //We don't have lat and lang in API, so I use mock data here.
                              onPressed: () => bloc.add(NavigationEvent(
                                  lat: 35.70884, long: 51.21253)),
                              child: const Text(Constants.navigationButton),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
 
              ],
            ),
          ),
        ),
      ),
    );
  }
}
