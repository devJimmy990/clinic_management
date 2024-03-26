import 'package:flutter/material.dart';
import 'package:hospital/.widgets/search_box.dart';
import 'package:hospital/constants/strings.dart';
import 'package:hospital/models/doctor.dart';
import 'package:hospital/models/department.dart';
import 'package:hospital/.widgets/row_title.dart';
import 'package:hospital/models/data_search.dart';
import 'package:hospital/.widgets/doctor_card.dart';
import 'package:hospital/.widgets/department_card.dart';
import 'package:hospital/screens/dep_doctors_page.dart';
import 'package:hospital/screens/doctor_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Department dep;
  late Doctor doc;
  @override
  void initState() {
    dep = Department.def();
    doc = Doctor.def();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 2,
              child: searchBox(
                delegate: DataSearch(),
                context: context,
                label: kFindLabel,
              ),
            ),
            const Spacer(),
          ],
        ),
        //Appointment UI (Row{Appointment & See All Apointments => New Screen})
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Spacer(),
              Expanded(
                flex: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      kAppointmentsLabel,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () => Navigator.pushReplacementNamed(
                          context, kPagesNavAppointment),
                      child: const Text(
                        kSeeLabel,
                        style: TextStyle(
                            color: Colors.yellowAccent,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
        //Category UI (Row{Category & See All Categories => New Screen})
        //This is Outsource Widget
        myRowTitle(
          label: kDepartmentLabel,
          onTap: () => Navigator.pushNamed(
            context,
            kPagesNavDepartments,
          ),
        ),
        const SizedBox(height: 5),
        Expanded(
          flex: 2,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: FutureBuilder(
              future: dep.getDepartmentsData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    final data = snapshot.data as List<Department>;
                    return Row(
                      children: List.generate(
                        data.length > 4 ? 4 : data.length,
                        (index) {
                          return departmentCard(
                            department: data[index],
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DepDoctorsPage(index: index + 1)),
                              );
                            },
                          );
                        },
                      ),
                    );
                  }
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 15),
        //Doctors UI (Row{Doctors & See All Doctors => New Screen})
        myRowTitle(
          label: kTopLabel,
          onTap: () => Navigator.pushNamed(context, kPagesNavDoctors),
        ),
        const SizedBox(height: 5),
        Expanded(
          flex: 4,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: FutureBuilder(
              future: doc.getDoctorsData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    final data = snapshot.data as List<Doctor>;
                    return Row(
                      children: List.generate(
                        data.length > 4 ? 4 : data.length,
                        (index) {
                          return doctorCard(
                            doctor: data[index],
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DoctorDetailsPage(doctor: data[index]),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
