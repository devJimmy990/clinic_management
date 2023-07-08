import 'package:flutter/material.dart';
import 'package:hospital/screens/main.dart';
import 'package:hospital/models/report.dart';
import 'package:hospital/.widgets/snakbar.dart';
import 'package:hospital/constants/strings.dart';
import 'package:hospital/screens/report_details_page.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  Report report =
      Report.cus(id: patientSharedPrefs.getInt(kPatientPrefrsIDKey)!);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          padding:
              const EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 40),
          width: MediaQuery.of(context).size.width * .85,
          height: MediaQuery.of(context).size.height * .80,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.person_pin,
                size: 80,
                color: Colors.blue,
              ),
              FutureBuilder(
                future: report.getReportsData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      final data = snapshot.data as List<Report>;
                      return data.isEmpty
                          ? defReportWidget(
                              onTap: () =>
                                  ScaffoldMessenger.of(context).showSnackBar(
                                mySnakbar(
                                    label: kNoReportsLabel,
                                    context: context),
                              ),
                            )
                          : Column(
                              children: List.generate(
                                data.length,
                                (index) => Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: customButton(
                                    label: data[index].getReportLabel,
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ReportDetailsPage(
                                            report: data[index]),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                    }
                    if (snapshot.hasError) {
                      return defReportWidget(
                        onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                          mySnakbar(
                              label: kNoReportsLabel,
                              context: context),
                        ),
                      );
                    }
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget defReportWidget({required void Function() onTap}) {
  return Column(
    children: [
      customButton(label: "Radiology Reports", onTap: onTap),
      customButton(label: "Outpatient Visits", onTap: onTap),
      customButton(label: "Laboratory Results", onTap: onTap),
      customButton(label: "Inpatient Admission", onTap: onTap),
      customButton(label: "Emergency Unit Visits", onTap: onTap),
    ],
  );
}

Widget customButton({required String label, void Function()? onTap}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: InkWell(
      onTap: onTap,
      child: Container(
        width: 360,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    ),
  );
}
