import 'package:flutter/material.dart';
import 'package:hospital/constants/strings.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

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
              top: 10,
              child: Container(
                padding: const EdgeInsets.only(
                    top: 20, left: 30, right: 30, bottom: 40),
                width: MediaQuery.of(context).size.width * .85,
                height: MediaQuery.of(context).size.height * .80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Container(
                        width: 360,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey,
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            kMachinesLabel,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed(kPagesNavMachines);
                      },
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      child: Container(
                        width: 360,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey,
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            kRightsLabel,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed(kPagesNavRights);
                      },
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      child: Container(
                        width: 360,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey,
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            kResponsibilitiesLabel,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(kPagesNavResponsibility);
                      },
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 360,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blue[100],
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            Text(kContactMessageLabel,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red[600])),
                            const SizedBox(height: 20),
                            Row(
                              children: const [
                                Icon((Icons.location_on_sharp),
                                    color: Colors.grey, size: 30),
                                Text(kLocationLabel,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red)),
                              ],
                            ),
                            const Text(kAddressLabel,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            const SizedBox(height: 20),
                            Row(
                              children: const [
                                Icon((Icons.person_pin_rounded),
                                    color: Colors.grey, size: 30),
                                Text(
                                  kContactLabel,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                )
                              ],
                            ),
                            const Text(
                              kEmailLabel,
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            const Text(
                              kPhoneLabel,
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
