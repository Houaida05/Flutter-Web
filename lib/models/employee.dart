// To parse this JSON data, do
//
//     final employee = employeeFromJson(jsonString);

import 'dart:convert';
Employee oneemployeeFromJson(String str) => Employee.fromJson(json.decode(str));

List<Employee> employeeFromJson(String str) => List<Employee>.from(json.decode(str).map((x) => Employee.fromJson(x)));

String employeeToJson(List<Employee> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Employee {
  Employee({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
  });

  int id;
  String firstname;
  String lastname;
  String email;

  factory Employee.fromJson(Map<String,dynamic> json) => Employee(
    id: json["id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    email: json["email"],
  );

  Map<String,dynamic> toJson() => {
    "id": id,
    "firstname": firstname,
    "lastname": lastname,
    "email": email,
  };
}
