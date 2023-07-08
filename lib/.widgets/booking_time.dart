import 'package:flutter/material.dart';

Widget bookingTimes(
    {required Function() onTap,
    required int index,
    required int selectedTime}) {
  return Container(
    color: Colors.transparent,
    child: InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        decoration: BoxDecoration(
          border: Border.all(
            color: selectedTime == index ? Colors.white : Colors.black,
          ),
          borderRadius: BorderRadius.circular(15),
          color: selectedTime == index ? Colors.redAccent : null,
        ),
        alignment: Alignment.center,
        child: Text(
          '${index + 9 >= 12 ? "${index - 2}:00 PM" : "${index + 9}:00 AM"}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: selectedTime == index ? Colors.black : null,
          ),
        ),
      ),
    ),
  );
}
