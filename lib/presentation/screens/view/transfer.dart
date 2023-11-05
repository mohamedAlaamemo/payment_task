import 'package:day_picker/day_picker.dart';
import 'package:day_picker/model/day_in_week.dart';
import 'package:desgin_task/presentation/resources/strings_manager.dart';
import 'package:desgin_task/presentation/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({Key? key}) : super(key: key);

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final List<DayInWeek> _days =  [
    DayInWeek(
      "Sun", dayKey: '',
    ),
    DayInWeek(
      "Mon", dayKey: '',
    ),
    DayInWeek("Tue", isSelected: true, dayKey: ''),
    DayInWeek(
      "Wed", dayKey: '',
    ),
    DayInWeek(
      "Thu", dayKey: '',
    ),
    DayInWeek(
      "Fri", dayKey: '',
    ),
    DayInWeek(
      "Sat", dayKey: '',
    ),
  ];
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          TextFormField(
            controller: _phoneController,
            decoration: const InputDecoration(
              labelText: AppStrings.phone,
              hintText: AppStrings.phone,
            ),
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(
            height: AppSize.s16,
          ),
          TextFormField(
            controller: _amountController,
            decoration: const InputDecoration(
              labelText: AppStrings.amount,
              hintText: AppStrings.amount,
            ),
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(
            height: AppSize.s16,
          ),
          Text(
            AppStrings.everyDay,
            style: TextStyle(
              color: ColorManager.primary
            ),
          ),
          const SizedBox(
            height: AppSize.s16,
          ),
          SelectWeekDays(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            days: _days,
            border: false,
            padding: 2,
            boxDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                colors: [Color(0xCCDC9C4A), Color(0xFFA68354)],
                tileMode:
                TileMode.repeated, // repeats the gradient over the canvas
              ),
            ),
            onSelect: (values) {
            },
          ),
          const SizedBox(
            height: AppSize.s16,
          ),
          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
                onPressed: (){},
                child:Text(
                  AppStrings.transfer,
                  style: TextStyle(
                      color: ColorManager.white
                  ),
                ),

            ),
          ),
          const SizedBox(
            height: AppSize.s16,
          ),
          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
                onPressed: (){},
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.primary
              ),
                child:Text(
                  AppStrings.back,
                  style: TextStyle(
                      color: ColorManager.white
                  ),
                ),

            ),
          ),
        ],
      ),
    );
  }
}
