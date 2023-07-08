import 'package:hospital/constants/connection.dart';
import 'package:hospital/constants/link_api.dart';

class Department {
  late int _id;
  late String _image;
  late String _name;
  late List<Department> list = [];
  Department.def();
  Department({
    required int id,
    required String image,
    required String name,
  })  : _name = name,
        _image = image,
        _id = id;

  getDepartmentsData() async {
    var response = await Connection.getInstance().postRequest(url: kDepView);
    if (response["status"] == "success") {
      for (var dep in response["data"]) {
        list.add(
          Department(
            id: dep["deparment_id"],
            image: dep["deparment_image"],
            name: dep["deparment_name"],
          ),
        );
      }
    }
    return list.isEmpty ? null : list;
  }

  set setDepartmentID(int val) => _id = val;
  set setDepartmentImage(String val) => _image = val;
  set setDepartmentName(String val) => _name = val;

  int get getDepartmentID => _id;
  String get getDepartmentImage => _image;
  String get getDepartmentName => _name;
  List<Department> get getDepartmentList => list;
}
