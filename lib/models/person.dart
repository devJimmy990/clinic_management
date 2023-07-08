abstract class Person {
  late int personID;
  late String personName;
  late String personEmail;
  late String personPassword;
  late String personMobile;

  Person.def() {
    personID = 0;
    personName = "";
    personEmail = "";
    personMobile = "";
    personPassword = "";
  }
  Person.add(
      {required String name,
      required String email,
      required String mobile,
      required String password}) {
    personName = name;
    personEmail = email;
    personMobile = mobile;
    personPassword = password;
  }
  Person.cus({required int id, required String name}) {
    personID = id;
    personName = name;
  }
  Person.gen({
    required this.personID,
    required this.personName,
    required this.personEmail,
    required this.personPassword,
    required this.personMobile,
  });

  set setPersonID(int val) => personID = val;
  set setPersonFullName(String val) => personName = val;
  set setPersonEmail(String val) => personEmail = val;
  set setPersonMobile(String val) => personMobile = val;
  set setPersonPassword(String val) => personPassword = val;

  int get getPersonID => personID;
  String get getPersonFullName => personName;
  String get getPersonEmail => personEmail;
  String get getPersonMobile => personMobile;
  String get getPersonPassword => personPassword;
}
