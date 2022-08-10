import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:start_web_app/pages/addEmployee.dart';
import 'package:start_web_app/pages/updateEmployee.dart';
import 'package:start_web_app/services/remote_service.dart';
import 'package:start_web_app/widgets/customButton.dart';
import '../models/employee.dart';
import 'homePage.dart';

class EmployeesPage extends StatefulWidget {
  const EmployeesPage({Key? key}) : super(key: key);

  @override
  State<EmployeesPage> createState() => _EmployeesPageState();
}

class _EmployeesPageState extends State<EmployeesPage> {
  List<Employee>? employees;
  var isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // fetch data from API
    getData();
  }

  getData() async {
    employees = await RemoteService().getEmployees();
    if (employees != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

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
            //First Row
            NavBar(),
            //Second Row
            Container(
              height: 400,
              width: 800,
              child: Visibility(
                visible: isLoaded,
                replacement: const Center(
                  child: CircularProgressIndicator(),
                ),
                child: SingleChildScrollView(
                  child: DataTable(
                    columns: const [
                      DataColumn(
                        label: Text('Firstname',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      DataColumn(
                        label: Text('Lastname',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      DataColumn(
                        label: Text('Email',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      DataColumn(
                        label: Text('Edit',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      DataColumn(
                        label: Text('Delete',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                    rows: employees != null
                        ? employees!
                            .map((employee) => DataRow(cells: [
                                  DataCell(Text(
                                    employee.firstname,
                                  )),
                                  DataCell(Text(
                                    employee.lastname,
                                  )),
                                  DataCell(
                                    Text(
                                      employee.email,
                                    ),
                                  ),
                                  DataCell(FlatButton(
                                    child: Text('Edit'),
                                    color: Colors.lightBlue,
                                    textColor: Colors.white,
                                    onPressed: ()  {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateEmployee(employeeID:employee.id)));
                                    },
                                  )),
                                  DataCell(FlatButton(
                                    child: Text('Delete'),
                                    color: Colors.red,
                                    textColor: Colors.white,
                                    onPressed: () async {
                                      await RemoteService().deleteEmployee(
                                          employee.id.toString());
                                      isLoaded = false;
                                      getData();
                                      setState(() {});
                                    },
                                  )),
                                ]))
                            .toList()
                        : [],
                  ),
                ),
                /*   child: Padding(
                        padding:  EdgeInsets.all(18.0),
                        child: Row(
                          children:  [
                              const Icon(Icons.person, color: Colors.blueAccent,),
                            Text(employees![index].firstname,
                              style: const TextStyle(fontWeight: FontWeight.bold),),
                            SizedBox(width:2),
                            Text(employees![index].lastname,
                              style: const TextStyle(fontWeight: FontWeight.bold),),
                            SizedBox(width: 20),
                            const Icon(Icons.email,color:Colors.blueAccent ,),
                            SizedBox(width:2),
                            Text(employees![index].email,style: TextStyle(fontWeight: FontWeight.bold),),
                            SizedBox(width: 20),
                            Icon(Icons.phone,color: Colors.blueAccent,),
                            SizedBox(width:2),
                            Text(employees![index].phoneNumber,style: TextStyle(fontWeight: FontWeight.bold),),





                          ],
                        ),
                      ),*/
              ),
            ),

            //Third Row
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

/*

class EmployeeCard extends StatefulWidget {
  @override
  State<EmployeeCard> createState() => _EmployeeCardState();
}

class _EmployeeCardState extends State<EmployeeCard> {

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      child: Padding(
        padding:  EdgeInsets.all(18.0),
        child: Column(
          children:  [
            Icon(Icons.person, color: Colors.blueAccent,),
            Text(employees![index].firstname,
              style: TextStyle(fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}

*/
Future<void> _showMyDialog(BuildContext context) async {
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('AlertDialog Title'),
        content: SingleChildScrollView(
          child: Column(
            children: const <Widget>[
              Text('This is a demo alert dialog.'),
              Text('Would you like to approve of this message?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Confirm'),
            onPressed: () {
              print('Confirmed');
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
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
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          }),
          CustomButton(Colors.lightBlueAccent, 'Employees', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => EmployeesPage()));
          }),
          CustomButton(Colors.blueAccent, 'Add Employee', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddEmployee()));
          }),
          CustomButton(Colors.blueAccent, 'Other', () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
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
