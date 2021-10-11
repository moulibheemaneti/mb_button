// Copyright 2021
/// Author : Mouli Bheemaneti

library mb_button;

/// Use of inbuilt material.dart flutter package to build this new widget.
import 'package:flutter/material.dart';
import 'package:mb_button/icon_button.dart';
import 'package:mb_button/text_button.dart';

class MBButton extends StatefulWidget {
  final String text;
  final Color? textColor;
  final Color? buttonColor;
  final IconData? icon;
  final bool isIconButton;
  final Function() onTapFunction;
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
    this.isIconButton = false,
    this.verticalPadding,
    this.horizontalPadding,
    this.roundness,
    this.elevation,
    required this.onTapFunction,
  }) : super(key: key);

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
      child: widget.isIconButton
          ? MBElevatedButton(
              elevation: widget.elevation ?? 5.0,
              roundness: widget.roundness ?? 0,
              buttonColor: widget.buttonColor ?? Colors.blue,
              textColor: widget.textColor ?? Colors.white,
              text: widget.text,
              onTapFunction: widget.onTapFunction,
            )
          : MBElevatedIconButton(
              icon: widget.icon!,
              text: widget.text,
              onTapFunction: widget.onTapFunction,
              elevation: widget.elevation ?? 5.0,
              roundness: widget.roundness ?? 0,
              buttonColor: widget.buttonColor ?? Colors.blue,
              textColor: widget.textColor ?? Colors.white,
            ),
    );
  }
}
