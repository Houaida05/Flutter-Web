import 'dart:convert';
import 'dart:io';

import 'package:start_web_app/models/employee.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<Employee>?> getEmployees() async {
    var client = http.Client();
    var uri = Uri.parse('http://localhost:5000/api/employees');
    print(uri);
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
    };

    var response = await client.get(uri, headers: headers);
    http.get(uri).then((response) => print(response.body));

    if (response.statusCode == 200) {
      var json = response.body;
      return employeeFromJson(json);
    }
  }

  Future<Employee> getEmployee(String id) async {
    var uri = Uri.parse('http://localhost:5000/api/employees/$id');
    print(uri);
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
    };
    var response = await http.get(uri, headers: headers);
    var json = response.body;
    return oneemployeeFromJson(json);
  }


  Future<http.Response>? deleteEmployee(String id) async {
    var uri = Uri.parse('http://localhost:5000/api/employees/$id');
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    final http.Response response = await http.delete(uri, headers: headers);
    return response;
  }

  Future<http.Response>? createEmployee(
      String firstname, String lastname, String email) async {
    var uri = Uri.parse('http://localhost:5000/api/employees');
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    final http.Response response = await http.post(uri,
        headers: headers,
        body: jsonEncode(<String, String>{
          'firstname': firstname,
          'lastname': lastname,
          'email': email,
        }));
    return response;
  }

  Future<http.Response>? updateEmployee(String id, String firstname, String lastname, String email) async {
    var uri = Uri.parse('http://localhost:5000/api/employees/$id');
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    final http.Response response = await http.put(uri,
        headers: headers,
        body: jsonEncode(<String, String>{
          'firstname': firstname,
          'lastname': lastname,
          'email': email,
        }));
    return response;
  }


}
