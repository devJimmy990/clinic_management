import 'package:hospital/constants/connection.dart';
import 'package:hospital/constants/link_api.dart';
import 'package:hospital/models/person.dart';

class Doctor extends Person {
  late String doctorImage;
  late String doctorDepartment;
  late int doctorRate;
  late List<Doctor> list = [];
  Doctor.def() : super.def();
  Doctor.cus({
    required int id,
    required String name,
    required String department,
    required String image,
  }) : super.cus(id: id, name: name) {
    doctorImage = image;
    doctorDepartment = department;
  }
  Doctor.gen({
    required int id,
    required String name,
    required String department,
    required String image,
    required int rate,
  }) : super.cus(id: id, name: name) {
    doctorImage = image;
    doctorRate = rate;
    doctorDepartment = department;
  }

  getDoctorsData() async {
    var response = await Connection.getInstance().postRequest(url: kDoctorView);
    if (response["status"] == "success") {
      for (var doc in response["data"]) {
        list.add(
          Doctor.gen(
            id: doc["doctor_id"],
            name: doc["doctor_name"],
            department: "${doc["department_id"]}",
            image: doc["doctor_image"],
            rate: doc["doctor_rating"],
          ),
        );
      }
    }
    return list.isEmpty ? null : list;
  }

  searchDoctor({required String name}) async {
    list.clear();
    var response = await Connection.getInstance().postRequest(
      url: kDoctorFind,
      data: {"doctorName": name},
    );
    if (response["status"] == "success") {
      for (var doc in response["data"]) {
        list.add(
          Doctor.gen(
            id: doc["doctor_id"],
            name: doc["doctor_name"],
            department: "${doc["department_id"]}",
            image: doc["doctor_image"],
            rate: doc["doctor_rating"],
          ),
        );
      }
    }
    return list;
  }

  findDoctor({required int depID}) async {
    var response = await Connection.getInstance().postRequest(
      url: kDoctorFind,
      data: {"departmentID": "$depID"},
    );
    if (response["status"] == "success") {
      for (var doc in response["data"]) {
        list.add(
          Doctor.gen(
            id: doc["doctor_id"],
            name: doc["doctor_name"],
            department: "${doc["department_id"]}",
            image: doc["doctor_image"],
            rate: doc["doctor_rating"],
          ),
        );
      }
    }
    return list.isEmpty ? null : list;
  }

  set setDoctorStars(int val) => doctorRate = val;
  set setDoctorDepartment(String val) => doctorDepartment = val;
  set setDoctorImage(String val) => doctorImage = val;

  int get getDoctorStars => doctorRate;
  String get getDoctorDepartment => doctorDepartment;
  String get getDoctorImage => doctorImage;
  List<Doctor> get getDoctorsList => list;
}
