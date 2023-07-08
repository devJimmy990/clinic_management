import 'package:http/http.dart' as http;
import 'dart:convert';

class Connection {
  static Connection? _connectionInstance;

  Connection._();
  static Connection getInstance() {
    _connectionInstance ??= Connection._();
    return _connectionInstance!;
  }

  getRequest({String? url}) async {
    try {
      var response = await http.get(Uri.parse(url!));
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        return responsebody;
      } else {
        print("Connection Error ${response.statusCode}");
      }
    } catch (e) {
      print("Connection Error $e");
    }
  }

  postRequest({required String? url, Map? data}) async {
    try {
      var response = await http.post(
        Uri.parse(url!),
        body: data,
      );
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        return responsebody;
      } else {
        print("Connection Error ${response.statusCode}");
      }
    } catch (e) {
      print("Connection Error $e");
    }
  }
}
