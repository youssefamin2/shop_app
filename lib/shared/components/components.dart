import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defaultFormFeild({
  required TextEditingController controller,
  required TextInputType type,
  required String? Function(String?)? validate,
  required String label,
  bool isPassword = false,
  bool isClickable = true,
  required IconData prefix,
  IconData? suffix,
  void Function()? suffixPressed,
  void Function(String)? onSubmit,
  void Function(String)? onChange,
  void Function()? ontap,
  double topRightRadius = 20.0,
  double bottomLeftRadius = 20.0,
}) =>
    TextFormField(
      controller: controller,
      onTap: ontap,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      enabled: isClickable,
      obscureText: isPassword,
      keyboardType: type,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
          topRight: Radius.circular(topRightRadius),
          bottomLeft: Radius.circular(bottomLeftRadius),
        )),
        suffixIcon: suffix != null
            ? IconButton(onPressed: suffixPressed, icon: Icon(suffix))
            : null,
      ),
    );
Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);

Future<bool?> showtoast({required String message, required ToastState state}) =>
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: chooseColorState(state),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToastState { SUCCESS, ERROR, WARNING }

Color chooseColorState(ToastState state) {
  Color color;
  switch (state) {
    case ToastState.SUCCESS:
      color = Colors.green;
      break;
    case ToastState.ERROR:
      color = Colors.red;
      break;
    case ToastState.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);


Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  double radius = 0.0,
  required Function function,
  required String text,
  bool isUpperCase = true,
  double fontSize = 30.0,
}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
          ),
        ),
      ),
    );

Widget buildCategoriesItem(model)=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Image(
        width: 80.0,
        height: 80.0,
        image: NetworkImage('${model.image}'),
        fit: BoxFit.cover,

      ),
      SizedBox(width: 20.0,),
      Text(
        '${model.name}',
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),

      ),
      Spacer(),
      Icon(
        Icons.arrow_forward_ios,
      ),

    ],
  ),
);

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);