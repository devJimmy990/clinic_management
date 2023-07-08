import 'package:flutter/material.dart';
import 'package:hospital/screens/main.dart';
import 'package:hospital/models/report.dart';
import 'package:hospital/constants/strings.dart';
import 'package:hospital/models/appointement.dart';
import 'package:hospital/.widgets/appointment_card.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  Appointment appointment = Appointment.def();
  Report report =
      Report.cus(id: patientSharedPrefs.getInt(kPatientPrefrsIDKey)!);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[200],
      body: FutureBuilder(
        future: appointment.getAppointmentsData(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              final data = snapshot.data as List<Appointment>;
              return data.isEmpty
                  ? const Center(child: Text(kNoAppointmentsLabel))
                  : ListView.builder(
                      itemCount: data.length,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 0, top: 2.5, right: 5, bottom: 2.5),
                          child: appointmentCard(
                            appointment: data[index],
                            onDoneTap: () async {
                              var res =
                                  await data[index].changeAppointmentStatus();
                              if (res) {
                                await report.createNewReport();
                                setState(() {});
                              }
                            },
                            onDeleteTap: () async {
                              var res = await data[index].deleteAppointment();
                              res ? setState(() {}) : null;
                            },
                          ),
                        );
                      }),
                    );
            }
            if (snapshot.hasError) {
              return const Center(child: Text(kNoAppointmentsLabel));
            }
          }

          return const Center(child: CircularProgressIndicator());
        }),
      ),
    );
  }
}
//  