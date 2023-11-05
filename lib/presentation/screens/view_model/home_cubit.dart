import 'package:bloc/bloc.dart';
import 'package:desgin_task/presentation/screens/view/recharge.dart';
import 'package:desgin_task/presentation/screens/view/sub_wallet.dart';
import 'package:desgin_task/presentation/screens/view/transfer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context)=>BlocProvider.of(context);

  List<Widget>screenList=const[
    RechargePage(),
    TransferPage(),
    SubWalletPage(),
  ];
  List<bool>screenState=[true,false,false];
  int screenIndex=0;
  void changeScreen({required int index}){
    screenIndex=index;
    for(int i=0;i<3;i++)
      {
        (i==index)?screenState[i]=true:screenState[i]=false;
      }
    emit(ChangeScreenEmitState());
  }
}
