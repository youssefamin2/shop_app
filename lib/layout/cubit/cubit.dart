import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorial/layout/cubit/states.dart';
import 'package:tutorial/models/home_model.dart';
import 'package:tutorial/models/login_model.dart';
import 'package:tutorial/shared/components/constants.dart';
import 'package:tutorial/shared/network/remote/dio_helper.dart';

import '../../models/cateogries.dart';
import '../../modules/Shop_app/cateogries/cateogries_Scree.dart';
import '../../modules/Shop_app/favorites/Favorites_screen.dart';
import '../../modules/Shop_app/products/products_screen.dart';
import '../../modules/Shop_app/settings/settings_screen.dart';

class ShopCubit extends Cubit<ShopStates>{
  ShopCubit() : super(ShopInitialState());
  static ShopCubit get(context) => BlocProvider.of(context);



  int currentIndex=0;

  List<Widget>bottomScreens=
  [
    ProductsScreen(),
    CateogriesScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];

void changeBottomNav(int index)
{
  currentIndex=index;
  emit(ShopChangeBottomNavState());

}


HomeModel? homeModel;


void getHomeData()
{
  emit(ShopLoadingHomeDataStates());
DioHelper.getData(url: HOME,token: token).then((value){
  emit(ShopSuccessHomeDataStates());
  homeModel=HomeModel.fromJson(value.data);
  print(homeModel!.data!.banners[0].image.toString());
}).catchError((error){
  emit(ShopErrorHomeDataStates());
  print(error.toString());
});
}
  CategoriesModel? categoriesModel;
  void categoriesData()
  {
    emit(ShopLoadingCategoriesDataStates());
    DioHelper.getData(url: Get_Categories,token: token).then((value){
      emit(ShopSuccessCategoriesDataStates());
    categoriesModel=CategoriesModel.fromJson(value.data);


    }).catchError((error){
      emit(ShopErrorCategoriesDataStates());
      print(error.toString());
    });
  }

  LoginModel?UserModel ;
  void GetuserData()
  {
    emit(ShopLoadingUserDataStates());
    DioHelper.getData(url: Get_Profile,token: token).then((value){
      UserModel=LoginModel.fromJson(value.data);
      emit(ShopSuccessUserDataStates(UserModel!));
    }).catchError((error){
      emit(ShopErrorUserDataStates());
      print(error.toString());
    });
  }


  void updateUserdata({
    required String name,
    required String email,
    required String phone,})
  {
    emit(ShopLoadingUpdateUserStates());
    DioHelper.putData(url: Update_Profile, token: token
        ,data:
    {
      'name':name,
      'email':email,
      'phone':phone,
    }).then((value) {
      UserModel=LoginModel.fromJson(value.data);
      emit(ShopSuccessUpdateUserStates(UserModel!));

    }).catchError((error){
      print(error.toString());
      emit(ShopErrorUpdateUserStates());
    });
  }


}