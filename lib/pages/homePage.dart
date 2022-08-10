
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:start_web_app/pages/addEmployee.dart';
import 'package:start_web_app/widgets/customButton.dart';

import 'employeesPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsetsDirectional.only(start: 120.0),
                      width: MediaQuery.of(context).size.width,
                      height: 500,
                      child: const Image(
                        image: AssetImage('images/emp_pg.jpg'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsetsDirectional.all(80.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Welcome to our App',
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 40),
                          ),
                          const Text(
                            'This is a simple CRUD app',
                            style: TextStyle(
                                color: Colors.lightBlue, fontSize: 15),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.amber[200],
                                borderRadius: BorderRadius.circular(18)),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('read more'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
          CustomButton(Colors.lightBlueAccent, 'Home',(){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
          }),

          CustomButton(Colors.blueAccent, 'Employees',(){Navigator.push(context, MaterialPageRoute(builder: (context)=>EmployeesPage()));
          }),

          CustomButton(Colors.blueAccent, 'Add Employee',(){Navigator.push(context, MaterialPageRoute(builder: (context)=>AddEmployee()));
          }),

          CustomButton(Colors.blueAccent, 'Other',(){Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
          }),
          Spacer(),
           Padding(
            padding: EdgeInsets.only(right: 30.0),
            child: InkWell(
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
              },
              child:const Text(
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


