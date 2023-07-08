import 'package:flutter/material.dart';
import 'package:hospital/models/machine.dart';
import 'package:hospital/.widgets/machine_card.dart';
import 'package:hospital/screens/more/machine/machine_details_page.dart';

class MedicalMachinePage extends StatelessWidget {
  final Machine machine = Machine.def();
  MedicalMachinePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[100],
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            itemCount: machinesList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: .9,
              crossAxisCount: 2,
            ),
            itemBuilder: (BuildContext context, int index) {
              return machineCard(
                machine: machinesList[index],
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MachineDetailsPage(
                      machine: machinesList[index],
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
