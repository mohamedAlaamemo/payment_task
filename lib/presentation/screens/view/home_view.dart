import 'package:barcode_widget/barcode_widget.dart';
import 'package:desgin_task/presentation/resources/color_manager.dart';
import 'package:desgin_task/presentation/resources/fonts_manager.dart';
import 'package:desgin_task/presentation/resources/strings_manager.dart';
import 'package:desgin_task/presentation/resources/values_manager.dart';
import 'package:desgin_task/presentation/screens/view_model/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                var cubit=HomeCubit.get(context);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.paymentTask,
                      style: TextStyle(
                          color: ColorManager.lightPrimary,
                          fontSize: FontSize.s16),
                    ),
                    const SizedBox(
                      height: AppSize.s16,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          color: ColorManager.primary),
                      child: Padding(
                        padding: const EdgeInsets.all(AppPadding.p16),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      AppStrings.myBalance,
                                      style: TextStyle(
                                          color: ColorManager.white,
                                          fontSize: FontSize.s16),
                                    ),
                                    const SizedBox(
                                      height: AppSize.s16,
                                    ),
                                    Text(
                                      '\$ 4255.26.456 ',
                                      style: TextStyle(
                                          color: ColorManager.white,
                                          fontSize: FontSize.s16),
                                    ),
                                    const SizedBox(
                                      height: AppSize.s16,
                                    ),
                                    Text(
                                      AppStrings.phone,
                                      style: TextStyle(
                                          color: ColorManager.white,
                                          fontSize: FontSize.s16),
                                    ),
                                    const SizedBox(
                                      height: AppSize.s16,
                                    ),
                                    Text(
                                      '01003047498',
                                      style: TextStyle(
                                          color: ColorManager.grey,
                                          fontSize: FontSize.s16),
                                    ),
                                  ],
                                ),
                                BarcodeWidget(
                                    padding: EdgeInsets.all(8),
                                    data: '01003047498',
                                    barcode: Barcode.qrCode(),
                                    height: 70,
                                    width: 70,
                                    backgroundColor: ColorManager.lightPrimary,
                                    color: ColorManager.white),
                              ],
                            ),
                            const SizedBox(
                              height: AppSize.s16,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      cubit.changeScreen(index: 0);
                                    },
                                    style: (cubit.screenIndex != 0)
                                            ? ElevatedButton.styleFrom(
                                                side: BorderSide(
                                                  color: ColorManager.white,
                                                  width: 1,
                                                ),
                                                backgroundColor:
                                                    ColorManager.primary)
                                            : null,
                                    child: Text(
                                      AppStrings.recharge,
                                      style: TextStyle(
                                          color: ColorManager.white,
                                          fontSize: FontSize.s12),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: AppSize.s8,
                                ),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      cubit.changeScreen(index: 1);
                                    },
                                    style: (cubit.screenIndex != 1)
                                        ? ElevatedButton.styleFrom(
                                        side: BorderSide(
                                          color: ColorManager.white,
                                          width: 1,
                                        ),
                                        backgroundColor:
                                        ColorManager.primary)
                                        : null,
                                    child: Text(
                                      AppStrings.transfer,
                                      style: TextStyle(
                                          color: ColorManager.white,
                                          fontSize: FontSize.s12),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: AppSize.s8,
                                ),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      cubit.changeScreen(index: 2);
                                    },
                                    style: (cubit.screenIndex != 2)
                                        ? ElevatedButton.styleFrom(
                                        side: BorderSide(
                                          color: ColorManager.white,
                                          width: 1,
                                        ),
                                        backgroundColor:
                                        ColorManager.primary)
                                        : null,
                                    child: Text(
                                      AppStrings.subWallet,
                                      style: TextStyle(
                                          color: ColorManager.white,
                                          fontSize: FontSize.s12),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s16,
                    ),
                    Expanded(child: cubit.screenList[cubit.screenIndex]),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
