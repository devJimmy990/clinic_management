import 'package:flutter/material.dart';

Widget myAuthBg({required Widget child}) {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/main_bg.png'),
        fit: BoxFit.fill,
      ),
    ),
    child: child,
  );
}
