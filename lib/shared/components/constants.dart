import '../../modules/Shop_app/Login/LoginScreen.dart';
import '../network/local/CacheHelper.dart';
import 'components.dart';

String LOGIN='login';
String REGISTER='register';
String HOME='home';
String Get_Categories='categories';
String Get_Profile='profile';
String Update_Profile='update-profile';
String FAVOURITES = 'favorites';
String? token = '';



void signOut(context) {
  CacheHelper.removeData(key: "token").then((value) {
    if (value) {
      navigateAndFinish(context, LoginScreen());
    }
  });
}