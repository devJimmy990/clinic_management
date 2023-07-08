import 'package:flutter/material.dart';

Widget myButton(
    {required void Function() onTap,
    required String label,
    required Color bgColor,
    double horPadding = 25,
    double verPadding = 8}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: horPadding,
        vertical: verPadding,
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  );
}
