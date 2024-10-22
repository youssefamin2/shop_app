import 'package:tutorial/models/login_model.dart';

abstract class ShopStates {}

class ShopInitialState extends ShopStates {}

class ShopChangeBottomNavState extends ShopStates {}

class ShopLoadingHomeDataStates extends ShopStates {}

class ShopSuccessHomeDataStates extends ShopStates {}

class ShopErrorHomeDataStates extends ShopStates {}



class ShopLoadingCategoriesDataStates extends ShopStates {}

class ShopSuccessCategoriesDataStates extends ShopStates {}

class ShopErrorCategoriesDataStates extends ShopStates {}



class ShopLoadingUserDataStates extends ShopStates {}

class ShopSuccessUserDataStates extends ShopStates
{
  final LoginModel loginModel;
  ShopSuccessUserDataStates(this.loginModel);
}

class ShopErrorUserDataStates extends ShopStates {}





class ShopLoadingUpdateUserStates extends ShopStates {}

class ShopSuccessUpdateUserStates extends ShopStates {
  final LoginModel loginModel;

  ShopSuccessUpdateUserStates(this.loginModel);
}

class ShopErrorUpdateUserStates extends ShopStates {}