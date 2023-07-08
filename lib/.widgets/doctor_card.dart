import 'package:flutter/material.dart';
import 'package:hospital/models/doctor.dart';
import 'package:hospital/constants/strings.dart';
Widget doctorCard({
  required Doctor doctor,
  required Function() onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 0),
      child: Card(
        color: Colors.grey,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(doctor.getDoctorImage,
                width: 200, height: 200, fit: BoxFit.cover),
            const SizedBox(height: 8),
            Text(
              doctor.getPersonFullName,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 5),
            Text(
              kSpecialistLabel,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < doctor.getDoctorStars; i++)
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 12,
                  ),
                const SizedBox(width: 5),
                Text(
                  "${doctor.getDoctorStars}/5",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                )
              ],
            )
          ],
        ),
      ),
    ),
  );
}
