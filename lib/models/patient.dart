import 'package:hospital/constants/connection.dart';
import 'package:hospital/constants/link_api.dart';
import 'package:hospital/constants/shared_pref.dart';
import 'package:hospital/models/person.dart';

class Patient extends Person {
  Patient.def() : super.def();
  Patient.add(
      {required String name,
      required String mobile,
      required String email,
      required String password})
      : super.add(name: name, email: email, mobile: mobile, password: password);

  createNewAccount() async {
    var response = await Connection.getInstance().postRequest(
      url: kPatientSignup,
      data: {
        "fullName": getPersonFullName,
        "patientPhone": getPersonMobile,
        "patientEmail": getPersonEmail,
        "patientPassword": getPersonPassword,
      },
    );
    if (response["status"] == "success") {
      setPatientPrefs(
        id: response["data"]["patient_id"],
        name: response["data"]["patient_name"],
        isLogged: true,
      );
      return true;
    }
    return false;
  }

  loginAccount() async {
    var response = await Connection.getInstance().postRequest(
      url: kPatientLogin,
      data: {
        "patientEmail": getPersonEmail,
        "patientPassword": getPersonPassword,
      },
    );
    if (response["status"] == "success") {
      setPatientPrefs(
        id: response["data"]["patient_id"],
        name: response["data"]["patient_name"],
        isLogged: true,
      );
      return true;
    }
    return false;
  }
}
