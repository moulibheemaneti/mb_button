// Copyright 2021
// Author : Mouli Bheemaneti

library mb_button;

// Use of inbuilt material.dart flutter package to build this new widget.
import 'package:flutter/material.dart';

class MBButton extends StatefulWidget {
  final String text;
  final Color textColor;
  final Color buttonColor;
  final Icon icon;
  final Function onTapFunction;
  final double verticalPadding;
  final double horizontalPadding;
  final double roundness;
  final double elevation;
  MBButton({
    @required this.text,
    this.textColor,
    this.buttonColor,
    this.icon,
    this.verticalPadding,
    this.horizontalPadding,
    this.roundness,
    this.elevation,
    @required this.onTapFunction,
  }) : assert(text != null);
  // onTap function should be of void type.
  // text should not be null
  // By default the button colors are
  @override
  _MBButtonState createState() => _MBButtonState();
}

class _MBButtonState extends State<MBButton> {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      padding: EdgeInsets.symmetric(
        vertical: widget.verticalPadding != null ? widget.verticalPadding : 35,
        horizontal:
            widget.horizontalPadding != null ? widget.horizontalPadding : 35,
      ),
      layoutBehavior: ButtonBarLayoutBehavior.padded,
      splashColor: widget.buttonColor != null
          ? widget.buttonColor.withOpacity(0.5)
          : Colors.blue.withOpacity(0.5),
      hoverColor: widget.buttonColor != null
          ? widget.buttonColor.withOpacity(0.5)
          : Colors.blue.withOpacity(0.5),
      buttonColor:
          widget.buttonColor != null ? widget.buttonColor : Colors.blue,
      child: new ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: widget.elevation != null ? widget.elevation : 5.0,
          primary:
              widget.buttonColor != null ? widget.buttonColor : Colors.blue,
          onPrimary: widget.textColor != null ? widget.textColor : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              widget.roundness != null ? widget.roundness : 0,
            ),
          ),
        ),
        // when the button is pressed, [widget.onTapFunction] is called.
        onPressed: widget.onTapFunction,
        child: new Text(
          widget.text,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
