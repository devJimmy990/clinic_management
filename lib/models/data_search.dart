import 'doctor.dart';
import 'package:flutter/material.dart';
import 'package:hospital/screens/doctor_details_page.dart';
import 'package:hospital/.widgets/search_doctor_search_card.dart';

class DataSearch extends SearchDelegate {
  final Doctor doc = Doctor.def();
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Center();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: doc.searchDoctor(name: query.toString()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final data = snapshot.data as List<Doctor>;
            return data.isEmpty
                ? const Center(child: Text("No Doctors Found"))
                : ListView.builder(
                    itemCount: data.length,
                    itemBuilder: ((context, index) {
                      return searchDoctorCard(
                        doctor: data[index],
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoctorDetailsPage(
                              doctor: data[index],
                            ),
                          ),
                        ),
                      );
                    }),
                  );
          }
          if (snapshot.hasError) {
            return const Center(child: Text("No Doctors Found"));
          }
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
