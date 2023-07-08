import 'package:flutter/material.dart';
import 'package:hospital/constants/reports.dart';
import 'package:hospital/constants/strings.dart';

class PatientResponsePage extends StatelessWidget {
  const PatientResponsePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              child: Container(
                color: Colors.blue,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .2,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30,
                        )),
                    Text(
                      kResponsibilitiesLabel,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 100,
              child: Container(
                padding: const EdgeInsets.only(
                    top: 20, left: 30, right: 30, bottom: 40),
                width: MediaQuery.of(context).size.width * .85,
                height: MediaQuery.of(context).size.height * .80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const SingleChildScrollView(
                  child: Text(
                    kPatientRespons,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
