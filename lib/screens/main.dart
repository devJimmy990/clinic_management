import 'login_page.dart';
import 'doctors_page.dart';
import 'reports_page.dart';
import 'departments_page.dart';
import 'base_home_layout.dart';
import 'appointement_page.dart';
import 'create_account_page.dart';
import 'package:flutter/material.dart';
import 'more/patient/patient_rights_page.dart';
import 'more/patient/patient_respons_page.dart';
import 'more/machine/medical_machines_page.dart';
import 'package:hospital/constants/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences patientSharedPrefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  patientSharedPrefs = await SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          kPagesNavBaseHome: (context) => const BaseHomeLayout(),
          kPagesNavLogin: (context) => const LoginPage(),
          kPagesNavDoctors: (context) => const DoctorsPage(),
          kPagesNavMedical: (context) => const ReportsPage(),
          kPagesNavAppointment: (context) => const AppointmentPage(),
          kPagesNavMachines: (context) => MedicalMachinePage(),
          kPagesNavSignup: (context) => const CreateAccountPage(),
          kPagesNavDepartments: (context) => const DepartmentsPage(),
          kPagesNavRights: (context) => const PatientRightsPage(),
          kPagesNavResponsibility: (context) => const PatientResponsePage(),
        },
        initialRoute: patientSharedPrefs.getBool(kPatientPrefrsIsLogged) == true
            ? kPagesNavBaseHome
            : kPagesNavLogin);
  }
}
