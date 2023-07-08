import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:hospital/screens/main.dart';
import 'package:hospital/models/doctor.dart';
import 'package:hospital/.widgets/snakbar.dart';
import 'package:hospital/.widgets/calender.dart';
import 'package:hospital/constants/strings.dart';
import 'package:hospital/models/appointement.dart';
import 'package:hospital/.widgets/booking_time.dart';

class BookingPage extends StatefulWidget {
  final Doctor doctor;
  const BookingPage({super.key, required this.doctor});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  int selected = -1, finalTime = -1;
  late Appointment appointment;
  DateTime today = DateTime.now(), focusedDay = DateTime.now();
  bool isWeekend = false, daySelected = true, timeSelected = false;

  @override
  Widget build(BuildContext context) {
    isWeekend = today.weekday == 5 || today.weekday == 6 ? true : false;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              calendarTable(
                today: today,
                focused: focusedDay,
                onDaySelected: (day, focused) => setState(() {
                  today = day;
                  daySelected = true;
                  focusedDay = focused;
                  if (today.weekday == 5 || today.weekday == 6) {
                    isWeekend = true;
                    timeSelected = false;
                    selected = -1;
                  } else {
                    isWeekend = false;
                    daySelected = true;
                    daySelected = true;
                  }
                }),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 35),
                child: Center(
                  child: Text(
                    kSelectTimeLabel,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
              isWeekend
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: const Text(
                        kWeekendLabel,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 120,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: GridView.builder(
                          itemCount: 8,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            childAspectRatio: 1.5,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                          ),
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return bookingTimes(
                              onTap: () => setState(() {
                                timeSelected = true;
                                selected = index;
                                finalTime =
                                    index + 9 >= 12 ? index - 2 : index + 9;
                              }),
                              index: index,
                              selectedTime: selected,
                            );
                          },
                        ),
                      ),
                    ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  child: const Text(
                    kBookLabel,
                    style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                  ),
                  onPressed: () async {
                    if (daySelected && timeSelected) {
                      final String finalDate =
                          DateFormat("yyyy-MM-dd").format(today);
                      appointment = Appointment.gen(
                        date: finalDate,
                        time: finalTime,
                        doctor: widget.doctor,
                        patient:
                            patientSharedPrefs.getInt(kPatientPrefrsIDKey)!,
                      );
                      if (await appointment.isPatientCanBook()) {
                        await appointment.createAppointment();
                        showSnakBar(label:kBookDoneLabel);
                      } else {
                        showSnakBar(label:kBookBeforeLabel);
                       }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showSnakBar({required String label}) {
    ScaffoldMessenger.of(context)
        .showSnackBar(mySnakbar(label: label, context: context));
  }
}
