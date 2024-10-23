import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorial/models/login_model.dart';
import 'package:tutorial/modules/Shop_app/Register/cubit/states.dart';
import 'package:tutorial/shared/components/constants.dart';
import 'package:tutorial/shared/network/remote/dio_helper.dart';

class ShopRegisterCubit extends Cubit<ShopRegisterStates> {
  ShopRegisterCubit() : super(InitialShopRegisterState());

  static ShopRegisterCubit get(context) => BlocProvider.of(context);
  LoginModel? registerUser;

  void userRegister({
    String? name,
    String? email,
    String? password,
    String? phone,
  }) {
    emit(ShopRegisterLoadingState());

    DioHelper.PostData(url: REGISTER, data: {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
    }).then((value) {
      registerUser=LoginModel.fromJson(value.data);
      emit(ShopRegisterSuccessState(registerUser!));
    }).catchError((error) {
      emit(ShopRegisterErrorState(error));
      print(error.toString());
    });
  }
}
