import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:desgin_task/presentation/resources/fonts_manager.dart';
import 'package:desgin_task/presentation/resources/strings_manager.dart';
import 'package:desgin_task/presentation/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';

class RechargePage extends StatefulWidget {
  const RechargePage({Key? key}) : super(key: key);

  @override
  State<RechargePage> createState() => _RechargePageState();
}

class _RechargePageState extends State<RechargePage> {
  int transaction=0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(AppPadding.p12),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.5,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(15))
          ),
          child: Row(
             children: [
               Icon(Icons.point_of_sale_sharp,color: ColorManager.lightPrimary,),
               const SizedBox(width: AppSize.s12,),
               Column(
                 children: [
                   Text(
                     AppStrings.myPoint,
                     style: TextStyle(
                       color: ColorManager.primary,
                       fontSize: FontSize.s16
                     ),
                   ),
                   const SizedBox(height: AppSize.s12,),
                   Text(
                     '74589',
                     style: TextStyle(
                         color: ColorManager.primary,
                         fontSize: FontSize.s22,
                       fontWeight: FontWeight.bold
                     ),
                   ),
                 ],
               ),
               const Spacer(),
               ElevatedButton(
                   onPressed: (){},
                 style: ElevatedButton.styleFrom(
                   backgroundColor: ColorManager.primary
                 ),
                   child: Text(
                     AppStrings.detailes,
                     style: TextStyle(
                       fontSize: AppSize.s16,
                       color: ColorManager.white
                     ),
                   ),
               )
             ],
          ),
        ),
        const SizedBox(height: AppPadding.p16,),
        Container(
          decoration: BoxDecoration(
              color: ColorManager.grey,
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                      onPressed: (){
                        setState(() {
                          transaction=0;
                        });
                      },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.all(Radius.circular(20),)
                      ),
                        backgroundColor:(transaction==1)?ColorManager.grey:null
                    ),
                      child: const Text(
                        AppStrings.transaction
                      ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                      onPressed: (){
                        setState(() {
                          transaction=1;
                        });
                      },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.all(Radius.circular(20),)
                        ),
                      backgroundColor:(transaction==0)?ColorManager.grey:null
                    ),
                    child: const Text(
                        AppStrings.braceletsOrCards
                      ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppPadding.p16,),
        Expanded(
          child: ConditionalBuilder(
            condition: transaction==0,
            builder: (context)=>ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context,index)=>transactionList(),
              separatorBuilder: (context,index)=>Container(
                margin: const EdgeInsets.all(8),
                height: 1.5,
                color: ColorManager.lightGrey,
              ), itemCount: 15,
            ),
            fallback: (context)=> ListView.separated(
               physics: const BouncingScrollPhysics(),
              itemBuilder: (context,index)=>cardsList(),
              separatorBuilder: (context,index)=>Container(
                margin: const EdgeInsets.all(8),
                height: 1.5,
                color: ColorManager.lightGrey,
              ), itemCount: 11,
            ),
          ),
        ),

      ],
    );
  }
  Widget transactionList(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DateTime.now().toString()
        ),
        const SizedBox(height: AppSize.s12,),
        Row(
          children: [
            Expanded(
              child: Text(
                'Recharge Wallet',
                style: TextStyle(
                  color: ColorManager.primary,
                  fontSize: FontSize.s18,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            const Text(
              '+250.020EG',
              style: TextStyle(
                color: Colors.greenAccent,
                fontSize: FontSize.s12,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget cardsList(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DateTime.now().toString()
        ),
        const SizedBox(height: AppSize.s12,),
        Row(
          children: [
            Expanded(
              child: Text(
                'Buying Coffee: 123456789',
                style: TextStyle(
                  color: ColorManager.primary,
                  fontSize: FontSize.s18,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            const Text(
              '-50.020EG',
              style: TextStyle(
                color: Colors.red,
                fontSize: FontSize.s12,
              ),
            ),
          ],
        ),
      ],
    );
  }

}
