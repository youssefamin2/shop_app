import 'package:flutter/material.dart';
import 'package:tutorial/shared/components/components.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var formkey = GlobalKey<FormState>();
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var phoneController = TextEditingController();
    var passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body:  Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15.0,),
                  const Text(
                    'Register now to browse our products ',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20.0,),
                  defaultFormFeild(controller: nameController, type: TextInputType.text, validate: (value){
                    if  (value == null || value.isEmpty)
                    {
                      return 'Please don\'t let me empty';
                    }
                      return null;

                  }, label: 'Name', prefix: Icons.person),
                  const SizedBox(height: 20.0,),
                  defaultFormFeild(controller: emailController, type: TextInputType.emailAddress, validate: (value){
                    if(value!.isEmpty)
                    {
                      return 'Please don\'t let me empty';
                    }
                      return null;

                  }, label: 'email', prefix: Icons.email_outlined),
                  const SizedBox(height: 20.0,),
                  defaultFormFeild(controller: phoneController, type: TextInputType.number, validate: (value){
                    if(value!.isEmpty)
                    {
                      return 'Please don\'t let me empty';
                    }
                      return null;

                  }, label: 'phone', prefix: Icons.phone),
                  const SizedBox(height: 20.0,),
                  defaultFormFeild(controller: passwordController, type: TextInputType.text, validate: (value){
                    if(value!.isEmpty)
                    {
                      return 'Please don\'t let me empty';
                    }
                      return null;

                  }, label: 'password', prefix: Icons.lock),
                  const SizedBox(height: 20.0,),

                  defaultButton(function:
                      ()
                  {
                    if(formkey.currentState!.validate())
                    {
                      print('form validate');
                    }
                  },
                      text: 'Submit'),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}