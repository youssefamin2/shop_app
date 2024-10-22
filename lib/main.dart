import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorial/layout/Shop_Layout.dart';
import 'package:tutorial/shared/components/constants.dart';
import 'package:tutorial/shared/network/local/CacheHelper.dart';
import 'package:tutorial/shared/network/remote/dio_helper.dart';
import 'bloc_observer.dart';
import 'layout/cubit/cubit.dart';
import 'modules/Shop_app/Login/LoginScreen.dart';
import 'modules/Shop_app/Register/RegisterScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
   token = CacheHelper.getdata(key: 'token');
  print(token);
  Widget initialScreen;
  if (token != null) {
    initialScreen = ShopLayout();
  } else {
    initialScreen = LoginScreen();
  }
  runApp(
      MyApp(
    initialScreen: initialScreen,
  ));
}

class MyApp extends StatelessWidget {
  final Widget initialScreen;

  const MyApp({super.key, required this.initialScreen});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>ShopCubit()..getHomeData()..categoriesData()..GetuserData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: const TextTheme(
            bodyMedium: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          primarySwatch: Colors.orange,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
            ),
            elevation: 0.0,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            type: BottomNavigationBarType.shifting,
            selectedItemColor: Colors.deepOrange,
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.white,
          ),
        ),
        home: initialScreen,
      ),
    );
  }
}
