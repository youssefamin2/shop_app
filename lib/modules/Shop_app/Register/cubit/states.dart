import '../../../../models/login_model.dart';

abstract class ShopRegisterStates {}

class InitialShopRegisterState extends ShopRegisterStates {}

class ShopRegisterLoadingState extends ShopRegisterStates {}

class ShopRegisterSuccessState extends ShopRegisterStates
{
  final LoginModel loginModel;

  ShopRegisterSuccessState(this.loginModel);
}

class ShopRegisterErrorState extends ShopRegisterStates
{
  final String error;

  ShopRegisterErrorState(this.error);
}

class ShopChangePasswordVisibilityState extends ShopRegisterStates{}