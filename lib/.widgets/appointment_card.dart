import 'package:flutter/material.dart';
import '../../models/appointement.dart';
import 'package:intl/intl.dart';
import 'package:hospital/.widgets/my_button.dart';
import 'package:hospital/constants/strings.dart';

Widget appointmentCard({
  required Appointment appointment,
  required void Function() onDoneTap,
  required void Function() onDeleteTap,
}) {
  return Card(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      topRight: Radius.circular(18),
      bottomLeft: Radius.circular(18),
      bottomRight: Radius.circular(18),
    )),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Image.network(
              appointment.getDoctor.getDoctorImage,
              fit: BoxFit.cover,
              width: 95,
              height: 95,
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    appointment.getDoctor.getPersonFullName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        letterSpacing: 1.08,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      appointment.getDoctor.getDoctorDepartment,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_month,
                                size: 20,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                DateFormat("dd-MM-yyyy").format(
                                  DateTime.parse(
                                      appointment.getAppointmentDate),
                                ),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          const SizedBox(width: 25),
                          Row(
                            children: [
                              Icon(
                                Icons.alarm,
                                size: 20,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "${appointment.getAppointmentTime >= 12 ? "${appointment.getAppointmentTime}:00 PM" : "${appointment.getAppointmentTime}:00 AM"}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
                padding: EdgeInsets.all(8),
                child: myButton(
                    onTap: onDoneTap, label: kDoneLabel, bgColor: Colors.green)),
            Padding(
                padding: EdgeInsets.all(8),
                child: myButton(
                    onTap: onDeleteTap, label: kDeleteLabel, bgColor: Colors.red)),
          ],
        )
      ],
    ),
  );
}
