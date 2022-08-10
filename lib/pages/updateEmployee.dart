import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:start_web_app/models/employee.dart';
import 'package:start_web_app/pages/homePage.dart';
import 'package:start_web_app/widgets/customButton.dart';

import '../services/remote_service.dart';
import 'employeesPage.dart';

class UpdateEmployee extends StatefulWidget {


  late int employeeID;


  UpdateEmployee({required this.employeeID});

  @override
  State<UpdateEmployee> createState() => _UpdateEmployeeState();
}

updateData(String id,String firstname, String lastname, String email) async {
  await RemoteService().updateEmployee(id, firstname, lastname, email);
  }


class _UpdateEmployeeState extends State<UpdateEmployee> {
  late bool _isEditingMode;
  TextEditingController emailController=TextEditingController();
  TextEditingController firstnameController=TextEditingController();
  TextEditingController lastnameController=TextEditingController();
  bool get isEditing => widget.employeeID != null;
  late Employee employee;
  bool _isLoading = false;

  @override
  void initState() {
   // TODO: implement initState
   super.initState();
   if (isEditing) {
     setState(() {
       _isLoading = true;
     });
     RemoteService().getEmployee(widget.employeeID.toString())
         .then((response) {
       setState(() {
         _isLoading = false;
       });

       employee = response ;
       firstnameController.text = employee.firstname;
       lastnameController.text = employee.lastname;
       emailController.text = employee.email;

     });
   } }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xfffcfcfc),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavBar(),
            Container(
                height: 400,
                width: 400,
                child: Form(
                  child: Column(
                    children: [
                      TextField(
                        controller: firstnameController,
                        decoration: const InputDecoration(
                          labelText: 'Firstname',
                        ),
                      ),
                      SizedBox(height: 40.0,),
                      TextField(
                        controller: lastnameController,
                        decoration: const InputDecoration(
                          labelText: 'Lastname',
                        ),
                      ),
                      SizedBox(height: 40.0,),
                       TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                        ),
                      ),
                      SizedBox(height: 60.0,),
                      Center(
                        child: FlatButton(color: Colors.lightBlue,
                        textColor: Colors.white,onPressed: () async{
                            await updateData(widget.employeeID.toString(),firstnameController.text, lastnameController.text, emailController.text);
                          print('submitted');
                          setState(() {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => EmployeesPage()));

                          });
                            }, child: Text('Submit'),
                        ),
                      )
                    ],
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  FaIcon(
                    FontAwesomeIcons.facebookF,
                    color: Colors.blueAccent,
                    size: 20.0,
                  ),
                  SizedBox(width: 3.0),
                  FaIcon(
                    FontAwesomeIcons.twitter,
                    color: Colors.blueAccent,
                    size: 20.0,
                  ),
                  SizedBox(width: 3.0),
                  FaIcon(
                    FontAwesomeIcons.linkedinIn,
                    color: Colors.blueAccent,
                    size: 20.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(130.0, 10.0, 0, 10.0),
      child: Row(
        children: [
          CustomButton(Colors.blueAccent, 'Home', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomePage()));
          }),
          CustomButton(Colors.blueAccent, 'Employees', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => EmployeesPage()));
          }),
          CustomButton(Colors.blueAccent, 'Add Employee', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomePage()));
          }),
          CustomButton(Colors.blueAccent, 'Other', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomePage()));
          }),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(right: 30.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: const Text(
                'LOGO',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
