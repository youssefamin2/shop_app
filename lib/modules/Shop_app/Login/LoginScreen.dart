import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorial/layout/Shop_Layout.dart';
import 'package:tutorial/modules/Shop_app/Login/cubit/cubit.dart';
import 'package:tutorial/modules/Shop_app/Login/cubit/states.dart';
import 'package:tutorial/shared/components/components.dart';
import 'package:tutorial/shared/network/local/CacheHelper.dart';

import '../../../shared/components/constants.dart';
import '../Register/RegisterScreen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>(); // Form key
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (context, state) {
          if (state is SuccessShopLoginState) {
            if (state.loginModel.status!) {
              print(state.loginModel.message);
              print(state.loginModel.data?.token);
              CacheHelper.saveData(
                      key: 'token', value: state.loginModel.data?.token)
                  .then((value) {
                token = state.loginModel.data?.token;

                navigateAndFinish(context, ShopLayout());
              });
              showtoast(
                  message: state.loginModel.message.toString(),
                  state: ToastState.SUCCESS);
            } else {
              print(state.loginModel.status);
              showtoast(
                  message: state.loginModel.message.toString(),
                  state: ToastState.ERROR);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey, // Assign formKey to the Form widget
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 250.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/onboard_1.jpg'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Text(
                          'LOGIN',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        // Email TextFormField
                        defaultFormFeild(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            validate: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                            label: 'Enter the email address',
                            prefix: Icons.email_outlined),

                        const SizedBox(
                          height: 20.0,
                        ),
                        // Password TextFormField change it to defaultformfeild and try it
                        defaultFormFeild(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          validate: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          label: 'Enter the Password',
                          prefix: Icons.lock_outline,
                          suffix: Icons.remove_red_eye,
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        // Login Button
                        Container(
                          width: double.infinity,
                          height: 50.0,
                          color: Colors.blue,
                          child: ConditionalBuilder(
                            condition: state is! LoadingShopLoginState,
                            builder: (context) => MaterialButton(
                              child: const Text(
                                'Login',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  ShopLoginCubit.get(context).UserLogin(
                                      email: emailController.text,
                                      password: passwordController.text);
                                } else {
                                  print('Form is not valid');
                                }
                              },
                            ),
                            fallback: (context) => const Center(
                                child: CircularProgressIndicator()),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        // Register section
                        Row(
                          children: [
                            const Text("Don't have an account?"),
                            const Spacer(),
                            TextButton(
                              onPressed: ()
                              {
                                navigateTo(context,const RegisterScreen());
                              },
                              child: const Text('Register Now'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
