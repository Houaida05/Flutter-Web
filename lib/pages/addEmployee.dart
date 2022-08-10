import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:start_web_app/widgets/customButton.dart';

import '../services/remote_service.dart';
import 'employeesPage.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({Key? key}) : super(key: key);

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

submitData(String firstname, String lastname, String email) async {
  await RemoteService().createEmployee(firstname, lastname, email);
  }


class _AddEmployeeState extends State<AddEmployee> {
  TextEditingController emailController=TextEditingController();
  TextEditingController firstnameController=TextEditingController();
  TextEditingController lastnameController=TextEditingController();

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
                         await submitData(firstnameController.text, lastnameController.text, emailController.text);
                          print('submitted');
                            Navigator.push(context,MaterialPageRoute(builder: (context) => EmployeesPage()));
                            }, child: Text('Add'),
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
                MaterialPageRoute(builder: (context) => AddEmployee()));
          }),
          CustomButton(Colors.blueAccent, 'Employees', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => EmployeesPage()));
          }),
          CustomButton(Colors.lightBlueAccent, 'Add Employee', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddEmployee()));
          }),
          CustomButton(Colors.blueAccent, 'Other', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddEmployee()));
          }),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(right: 30.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddEmployee()));
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
