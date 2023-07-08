import 'package:flutter/material.dart';
import 'package:hospital/constants/strings.dart';

Widget myRowTitle({required String label, required Function() onTap}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: onTap,
          child: const Text(
            kSeeLabel,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    ),
  );
}
