import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorial/modules/Shop_app/Login/cubit/states.dart';
import 'package:tutorial/shared/components/constants.dart';
import 'package:tutorial/shared/network/remote/dio_helper.dart';

import '../../../../models/login_model.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(InitialShopLoginState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);
  LoginModel? loginModel;
  void UserLogin({required String email, required String password}) {
    emit(LoadingShopLoginState());
    DioHelper.PostData(url: LOGIN, data: {'email': email, 'password': password})
        .then((value) {
      loginModel = LoginModel.fromJson(value.data);
      print(loginModel?.status);
      print(loginModel?.message);
      print(loginModel?.data?.token);
      emit(SuccessShopLoginState(loginModel!));
    }).catchError((error) {
      emit(ErrorShopLoginState(error.toString()));
      print(error.toString());
    });
  }
}
