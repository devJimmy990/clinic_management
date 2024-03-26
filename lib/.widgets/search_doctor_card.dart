import 'package:flutter/material.dart';
import 'package:hospital/models/doctor.dart';
import 'package:hospital/constants/strings.dart';

Widget searchDoctorCard({
  required Doctor doctor,
  required Function() onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 2.5, horizontal: 5),
      child: Card(
        color: Colors.grey,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(25))),
        child: Row(
          children: [
            Image.network(doctor.getDoctorImage,
                width: 120, height: 120, fit: BoxFit.cover),
            const SizedBox(height: 8),
            Expanded(
              child: Column(
                children: [
                  Text(
                    doctor.getPersonFullName,
                    textAlign: TextAlign.center,
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
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
