import 'package:tutorial/models/login_model.dart';

abstract class ShopLoginStates {}

class InitialShopLoginState extends ShopLoginStates {}

class LoadingShopLoginState extends ShopLoginStates {}

class SuccessShopLoginState extends ShopLoginStates {
  final LoginModel loginModel;

  SuccessShopLoginState(this.loginModel);
}

class ErrorShopLoginState extends ShopLoginStates {
  final String error;

  ErrorShopLoginState(this.error);
}

class ShopChangePasswordVisibilityState extends ShopLoginStates{}