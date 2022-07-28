import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:start_web_app/widgets/customButton.dart';

import 'homePage.dart';

class EmployeesPage extends StatefulWidget {
  const EmployeesPage({Key? key}) : super(key: key);

  @override
  State<EmployeesPage> createState() => _EmployeesPageState();
}

class _EmployeesPageState extends State<EmployeesPage> {
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
              child: ListView(
                children: [
                  EmployeeCard(), EmployeeCard(),
                  EmployeeCard(),  EmployeeCard(),
                  EmployeeCard(),  EmployeeCard(),
                ],
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

class EmployeeCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: const [
            Icon(Icons.email,color: Colors.blueAccent,),
            Text('this is the mail adress',style: TextStyle(fontWeight: FontWeight.bold),)
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
          CustomButton(Colors.blueAccent, 'Home',(){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
          }),

          CustomButton(Colors.lightBlueAccent, 'Employees',(){Navigator.push(context, MaterialPageRoute(builder: (context)=>EmployeesPage()));
          }),

          CustomButton(Colors.blueAccent, 'Other',(){Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
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


