import 'package:flutter/material.dart';
import 'package:hospital/models/department.dart';

Widget departmentCard({
  required Department department,
  required Function() onTap,
  double width = 100,
  double height = 85,
}) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Padding(
      padding: EdgeInsets.all(8),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              department.getDepartmentImage,
              width: width,
              height: height,
            ),
            const SizedBox(height: 15),
            Text(
              department.getDepartmentName,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    ),
  );
}
