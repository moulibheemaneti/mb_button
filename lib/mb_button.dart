// Copyright 2021
// Author : Mouli Bheemaneti

library mb_button;

/// Use of inbuilt material.dart flutter package to build this new widget.
import 'package:flutter/material.dart';

class MBButton extends StatefulWidget {
  final String text;
  final Color? textColor;
  final Color? buttonColor;
  final Icon? icon;
  final bool? isIconButton;
  final Function()? onTapFunction;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? roundness;
  final double? elevation;
  const MBButton({
    Key? key,
    required this.text,
    this.textColor,
    this.buttonColor,
    this.icon,
    this.isIconButton,
    this.verticalPadding,
    this.horizontalPadding,
    this.roundness,
    this.elevation,
    required this.onTapFunction,
  }) : super(key: key);

  /// 'onTap' function should be of void type.
  /// Text should not be null

  @override
  _MBButtonState createState() => _MBButtonState();
}

class _MBButtonState extends State<MBButton> {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      padding: EdgeInsets.symmetric(
        /// Default vertical padding is 35
        vertical: widget.verticalPadding ?? 35,

        /// Default horizontal padding is 35
        horizontal: widget.horizontalPadding ?? 35,
      ),
      layoutBehavior: ButtonBarLayoutBehavior.padded,

      /// Default splashColor is Colors.blue with 0.5 opacity
      splashColor: widget.buttonColor != null
          ? widget.buttonColor!.withOpacity(0.5)
          : Colors.blue.withOpacity(0.5),

      /// Default hoverColor is Colors.blue with 0.5 opacity
      hoverColor: widget.buttonColor != null
          ? widget.buttonColor!.withOpacity(0.5)
          : Colors.blue.withOpacity(0.5),

      /// Default hoverColor is Colors.blue
      buttonColor: widget.buttonColor ?? Colors.blue,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          /// Default elevation is 5
          elevation: widget.elevation ?? 5.0,

          /// Default primary color is Colors.blue
          primary: widget.buttonColor ?? Colors.blue,

          /// Default onPrimary color is Colors.blue
          onPrimary: widget.textColor ?? Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              /// The shape of this button is circluar and it has no roundess by default.
              /// If entered, then the roundess is set to that value
              widget.roundness ?? 0,
            ),
          ),
        ),

        /// When the button is pressed, [widget.onTapFunction] is called.
        onPressed: widget.onTapFunction,
        child: Text(
          widget.text,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
