import 'package:chapar_task/core/utils/constants.dart';
import 'package:chapar_task/core/utils/theme.dart';
import 'package:chapar_task/features/feature_delivery/presentation/bloc/delivery_bloc.dart';
import 'package:chapar_task/features/feature_delivery/presentation/widgets/address_card.dart';
import 'package:chapar_task/features/feature_delivery/presentation/widgets/details_card.dart';
import 'package:chapar_task/features/feature_delivery/presentation/widgets/functions_card.dart';
import 'package:chapar_task/features/feature_delivery/presentation/widgets/pin_card.dart';
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
    final isFemale = delivery.receiver!.gender == 'f';

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
                PinCard(
                  controller: inputController,
                ),
                SizedBox(height: 5.h),
                AddressCard(
                  address: delivery.receiverAddress!.fullAddress!,
                ),
                SizedBox(height: 5.h),
                DetailCard(
                    isFemale: isFemale,
                    phoneNumber: delivery.receiver!.mobile!),
                SizedBox(height: 5.h),
                FunctionsCard(
                  phoneNumber: delivery.receiver!.mobile!,
                  isCod: delivery.isCod ?? false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
