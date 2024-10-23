import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorial/layout/cubit/cubit.dart';
import 'package:tutorial/layout/cubit/states.dart';
import 'package:tutorial/shared/components/constants.dart';

import '../../../shared/components/components.dart';
import '../Login/cubit/cubit.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var name = TextEditingController();
    var emailController = TextEditingController();
    var phoneController = TextEditingController();
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state)
      {

      },
      builder: (context, state) {
        var model = ShopCubit.get(context).UserModel;
        if (model == null) {
          return Center(child: CircularProgressIndicator());
        }
        name.text = model!.data!.name!.toString();
        emailController.text = model.data!.email.toString();
        phoneController.text = model.data!.phone.toString();
        return ConditionalBuilder(
          condition:  ShopCubit.get(context).UserModel != null,
          builder: (context) => Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (state is ShopLoadingUpdateUserStates)
                        LinearProgressIndicator(),
                      SizedBox(height: 20.0),
                      defaultFormFeild(
                          controller: name,
                          type: TextInputType.name,
                          validate: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter name';
                            }
                            return null;
                          },
                          label: 'Name',
                          prefix: Icons.person),
                      const SizedBox(
                        height: 20.0,
                      ),
                      defaultFormFeild(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                          label: 'Email Address',
                          prefix: Icons.email_outlined),
                      const SizedBox(
                        height: 20.0,
                      ),
                      defaultFormFeild(
                        controller: phoneController,
                        type: TextInputType.phone,
                        validate: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone';
                          }
                          return null;
                        },
                        label: 'Phone',
                        prefix: Icons.phone,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      defaultButton(
                          function: () {
                            if (formKey.currentState!.validate()) {
                              ShopCubit.get(context).updateUserdata(
                                  name: name.text,
                                  email: emailController.text,
                                  phone: phoneController.text);
                            }
                          },
                          text: 'Update'),
                      SizedBox(
                        height: 40.0,
                      ),
                      defaultButton(
                          function: () {
                            signOut(context);
                          },
                          text: 'Log Out'
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          fallback: (context) => Center(child: const CircularProgressIndicator()),
        );
      },
    );
  }
}
