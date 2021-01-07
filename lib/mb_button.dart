library mb_button;

import 'package:flutter/material.dart';

class MBButton extends StatefulWidget {
  final String text;
  final Color textColor;
  final Color buttonColor;
  final Icon icon;
  final Function onTapFunction;
  MBButton(
      {@required this.text,
      this.textColor,
      this.buttonColor,
      this.icon,
      @required this.onTapFunction})
      : assert(text != null);
  @override
  _MBButtonState createState() => _MBButtonState();
}

class _MBButtonState extends State<MBButton> {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      padding: EdgeInsets.fromLTRB(35.0, 12.0, 35.0, 12.0),
      minWidth: 120,
      buttonColor:
          widget.buttonColor != null ? widget.buttonColor : Colors.blue,
      child: new RaisedButton(
        elevation: 5.0,
        textColor: widget.textColor != null ? widget.textColor : Colors.white,
        onPressed: () {
          widget.onTapFunction;
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: new Text(
          widget.text,
          style: TextStyle(
            fontSize: 20.0,
            letterSpacing: 1.0,
          ),
        ),
        color: Colors.brown,
      ),
    );
  }
}
