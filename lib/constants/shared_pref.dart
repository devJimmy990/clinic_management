import 'package:hospital/screens/main.dart';
import 'package:hospital/constants/strings.dart';

resetPatientPrefs() {
  patientSharedPrefs.setInt(kPatientPrefrsIDKey, 0);
  patientSharedPrefs.setString(kPatientPrefrsNameKey, "");
  patientSharedPrefs.setBool(kPatientPrefrsIsLogged, false);
}

setPatientPrefs(
    {required int id, required String name, required bool isLogged}) {
  patientSharedPrefs.setInt(kPatientPrefrsIDKey, id);
  patientSharedPrefs.setString(kPatientPrefrsNameKey, name);
  patientSharedPrefs.setBool(kPatientPrefrsIsLogged, isLogged);
}
