import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget myTextForm({
  required String label,
  required TextEditingController controller,
  Function()? onIconPressed,
  Icon? passwordIcon,
  bool isNumber = false,
  bool isPassword = false,
  bool isHide = false,
}) {
  return TextFormField(
    controller: controller,
   
    inputFormatters:
        isNumber ? [FilteringTextInputFormatter.allow(RegExp('[0-9,]'))] : [],
    keyboardType: isNumber ? TextInputType.number : TextInputType.text,
    obscureText: isPassword
        ? isHide
            ? true
            : false
        : false,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontStyle: FontStyle.italic,
      ),
      suffixIcon: isPassword
          ? isHide
              ? IconButton(onPressed: onIconPressed, icon: passwordIcon!)
              : IconButton(onPressed: onIconPressed, icon: passwordIcon!)
          : SizedBox(),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blue)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blue)),
    ),
  );
}
