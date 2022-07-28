import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/homePage.dart';

class CustomButton extends StatefulWidget {
Color color;
String name;
VoidCallback onTap;
CustomButton(this.color,this.name,this.onTap);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: widget.onTap,
      child: Text(
        widget.name,
        style: TextStyle(color: widget.color, fontSize: 16),
      ),
    );
  }
}
