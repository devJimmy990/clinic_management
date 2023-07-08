
import 'package:hospital/constants/reports.dart';

class Machine {
  late String name;
  late String image;
  late String description;
  Machine.def();
  Machine({
    required this.name,
    required this.image,
    required this.description,
  });
  set setMachineName(String val) => name = val;
  set setMachineImage(String val) => image = val;
  set setMachineDescription(String val) => description = val;

  String get getMachineName => name;
  String get getMachineImage => image;
  String get getMachineDescription => description;


}
List<Machine> machinesList = [
  Machine(
    name: "Imaging and Navigation System",
    description: kImagingandNavigationSystem,
    image: "assets/images/3D Imaging and Navigation System.png",
  ),
  Machine(
    name: '4d Ultrasound',
    description: kUltrasound,
    image: 'assets/images/4d Ultrasound.png',
  ),
  Machine(
    name: "Angiography",
    description: kAngiography,
    image: "assets/images/Angiography.png",
  ),
  Machine(
    name: 'CT',
    description: kUltrasound,
    image: 'assets/images/CT.png',
  ),
  Machine(
    name: "Digital C-Arm",
    description: kDigitalCArm,
    image: "assets/images/Digital C-Arm.png",
  ),
  Machine(
    name: 'Digital Mammography',
    description: kDigitalMammography,
    image: 'assets/images/Digital Mammography.png',
  ),
  Machine(
    name: "Electrophisiolgy",
    description: kElectrophisiolgy,
    image: "assets/images/Electrophisiolgy.png",
  ),
  Machine(
    name: 'Endoscopic Ultrasound',
    description: kEndoscopicUltrasound,
    image: 'assets/images/Endoscopic Ultrasound.png',
  ),
  Machine(
    image: "assets/images/MRI.png",
    name: "MRI",
    description: kMRI,
  ),
  Machine(
    name: 'Robotic Surgery',
    description: kRoboticSurgery,
    image: 'assets/images/Robotic Surgery.jpg',
  ),
  Machine(
    name: "Single Dose Radiotherapy",
    description: kSingleDoseRadiotherapy,
    image: "assets/images/Single Dose Radiotherapy.png",
  ),
  Machine(
    name: 'True Beam LINAC',
    description: kTrueBeamLINAC,
    image: 'assets/images/True Beam LINAC.png',
  ),
];