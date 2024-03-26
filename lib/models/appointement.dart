import 'package:hospital/constants/connection.dart';
import 'package:hospital/constants/link_api.dart';
import 'package:hospital/constants/strings.dart';
import 'package:hospital/models/doctor.dart';
import 'package:hospital/screens/main.dart';

class Appointment {
  late String id;
  late int time;
  late String date;
  late Doctor doctor;
  late int patient;
  late bool isDone = false;
  List<Appointment> list = [];

  Appointment.def() {
    id = "";
    date = "";
    time = 0;
    doctor = Doctor.def();
    patient = -1;
    isDone = false;
  }
  Appointment.gen({
    required this.date,
    required this.time,
    required this.doctor,
    required this.patient,
  });
  Appointment.cus({
    required this.id,
    required this.date,
    required this.time,
    required this.doctor,
  });
  getAppointmentsData() async {
    list.clear();
    var response = await Connection.getInstance().postRequest(
        url: kAppointmentView,
        data: {
          "patientID": patientSharedPrefs.getInt(kPatientPrefrsIDKey).toString()
        });
    if (response["status"] == "success") {
      for (var dep in response["data"]) {
        list.add(Appointment.cus(
          id: dep["appointment_id"].toString(),
          date: dep["appointment_date"],
          time: dep["appointment_time"],
          doctor: Doctor.cus(
              id: dep["doctor_id"],
              name: dep["doctor_name"],
              department: dep["deparment_name"],
              image: dep["doctor_image"]),
        ));
      }
    }
    return list;
  }

  deleteAppointment() async {
    bool isChanged = false;
    var response = await Connection.getInstance()
        .postRequest(url: kAppointmentDelete, data: {
      "appointmentID": getAppointmentID,
    });
    response["status"] == "success" ? isChanged = true : isChanged = false;
    return isChanged;
  }

  checkAppointmentFound({required int patientID, required int doctorID}) async {
    var response = await Connection.getInstance()
        .postRequest(url: kAppointmentCheck, data: {
      "patientID": "$patientID",
      "doctorID": "$doctorID",
    });
    print("Response is: $response");
  }

  changeAppointmentStatus() async {
    bool isChanged = false;
    var response = await Connection.getInstance()
        .postRequest(url: kAppointmentStatus, data: {
      "appointmentID": getAppointmentID,
    });
    response["status"] == "success" ? isChanged = true : isChanged = false;
    return isChanged;
  }

  createAppointment() async {
    var response = await Connection.getInstance().postRequest(
      url: kAppointmentCreate,
      data: {
        "date": getAppointmentDate,
        "doctorID": getDoctor.getPersonID.toString(),
        "time": getAppointmentTime.toString(),
        "patientID": getPatientID.toString(),
      },
    );
    if (response["status"] == "success") {
      return true;
    } else {
      return false;
    }
  }

  set setDoctorID(Doctor val) => doctor = val;
  set setAppointment(String val) => id = val;
  set setAppointmentTime(int val) => time = val;
  set setPatient(int val) => patient = val;
  set setAppointmentDate(String val) => date = val;
  set setAppointmentIsDone(bool val) => isDone = val;

  Doctor get getDoctor => doctor;
  String get getAppointmentID => id;
  int get getAppointmentTime => time;
  int get getPatientID => patient;
  String get getAppointmentDate => date;
  bool get getAppointmentIsDone => isDone;
}
