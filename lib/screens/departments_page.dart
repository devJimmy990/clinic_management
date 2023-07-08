import 'dep_doctors_page.dart';
import 'package:flutter/material.dart';
import 'package:hospital/models/department.dart';
import 'package:hospital/.widgets/department_card.dart';

class DepartmentsPage extends StatelessWidget {
  const DepartmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Department dep = Department.def();
    return Scaffold(
        backgroundColor: Colors.green[100],
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 8),
          child: FutureBuilder(
            future: dep.getDepartmentsData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  final data = snapshot.data as List<Department>;
                  return GridView.builder(
                    itemCount: data.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return departmentCard(
                        width: 170,
                        height: 100,
                        department: data[index],
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DepDoctorsPage(index: index + 1),
                          ),
                        ),
                      );
                    },
                  );
                }
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ));
  }
}
