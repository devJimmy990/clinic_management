import 'doctor_details_page.dart';
import 'package:flutter/material.dart';
import 'package:hospital/models/doctor.dart';
import 'package:hospital/.widgets/doctor_card.dart';


class DoctorsPage extends StatelessWidget {
  const DoctorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Doctor doc = Doctor.def();
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 8),
        child: FutureBuilder(
          future: doc.getDoctorsData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                final data = snapshot.data as List<Doctor>;
                return GridView.builder(
                  itemCount: data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 5,
                      childAspectRatio: .6),
                  itemBuilder: (context, index) {
                    return doctorCard(
                        doctor: data[index],
                        onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DoctorDetailsPage(doctor: data[index]),
                              ),
                            ));
                  },
                );
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
