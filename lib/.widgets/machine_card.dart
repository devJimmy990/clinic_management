import 'package:flutter/material.dart';
import 'package:hospital/models/machine.dart';

Widget machineCard({required Machine machine, required void Function() onTap}) {
  return InkWell(
    child: Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 4,
              child: Image.asset(
                machine.getMachineImage,
                width: 75,
                height: 75,
                fit: BoxFit.cover,
              )),
          const SizedBox(height: 8),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                machine.name,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: const TextStyle(
                    fontSize: 15.0, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    ),
    onTap: onTap,
  );
}
