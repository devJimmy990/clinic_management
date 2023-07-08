import 'package:flutter/material.dart';

SnackBar mySnakbar({required String label, required BuildContext context}) {
  return SnackBar(
    width: 200,
    duration: Duration(seconds: 1),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.grey,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    content: Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
      child: Center(
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
    ),
  );
}
