import 'package:hospital/constants/connection.dart';
import 'package:hospital/constants/link_api.dart';
import 'package:hospital/constants/reports.dart';

class Report {
  late int patientID;
  late String label;
  late String content;
  List<Report> list = [];

  Report.def();
  Report.cus({required int id}) {
    patientID = id;
  }
  Report.gen({
    required this.patientID,
    required this.label,
    required this.content,
  });
  isReportExist() async {}

  createNewReport() async {
    await Connection.getInstance().postRequest(url: kReportCreate, data: {
      "patientID": getPatientID.toString(),
      "reportLaboratory": kLapReport,
      "reportRadiology": kRadiology,
    });
  }

  getReportsData() async {
    list.clear();
    var response = await Connection.getInstance().postRequest(
        url: kReportView, data: {"patientID": getPatientID.toString()});
    if (response["status"] == "success") {
      list.add(Report.gen(
          patientID: getPatientID,
          label: "Laboratory Results",
          content: response["data"]["laboratory"]));
      list.add(Report.gen(
          patientID: getPatientID,
          label: "Radiology Reports",
          content: response["data"]["radiology"]));
      list.add(Report.gen(
          patientID: getPatientID,
          label: "Inpatient Admission",
          content:
              "Inpatient Admission \n ${response["data"]["inpatient_admission"]}"));
      list.add(Report.gen(
          patientID: getPatientID,
          label: "Outpatient Visits",
          content:
              "Outpatient Visits \n ${response["data"]["oupatient_visits"]}"));
      list.add(Report.gen(
          patientID: getPatientID,
          label: "Emergency Unit Visits",
          content:
              "Emergency Unit Visits: \n ${response["data"]["emergency_visits"]}"));
    }
    return list;
  }

  set setPatienttID(int val) => patientID = val;
  set setReportLabel(String val) => label = val;
  set setReportContent(String val) => content = val;

  int get getPatientID => patientID;
  String get getReportLabel => label;
  String get getReportContent => content;
}
