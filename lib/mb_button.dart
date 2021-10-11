/// Copyright 2021
/// Author : Mouli Bheemaneti

library mb_button;

/// Use of inbuilt material.dart flutter package to build this new widget.
import 'package:flutter/material.dart';
import 'package:mb_button/icon_button.dart';
import 'package:mb_button/text_button.dart';

///
/// [MBButton] is a [StatefulWidget] which returns a [ButtonTheme] widget whose
/// child will be either [MBElevatedButton] or [MBElevatedIconButton] depending
/// on [isIconButton].
///
/// [MBButton] takes [text], [textColor], [buttonColor], [icon],
/// [isIconButton], [verticalPadding], [horizontalPadding], [roundness],
/// [elevation] and [onTapFunction] as it's arguments.
///
/// Few factors like [elevation], [text], [roundness], [buttonColor], [textColor],
/// [onTapFunction] are either passed to [MBElevatedButton] or [MBElevatedIconButton]
/// depending on [isIconButton].
///
/// If [isIconButton] is set false, then the above mentioned factors are passed to
/// [MBElevatedButton].
/// And if [isIconButton] is set true, then the above mentioned factors are passed
/// to [MBElevatedIconButton].
/// If [isIconButton] set to true then the [icon] must be passed or else it will show the
/// default [Icon]. Here the default [icon] is [Icons.add].
///
class MBButton extends StatefulWidget {
  /// [text] is the value of the text which is displayed on [MBButton]
  /// Since this [text] field is requierd, there is no default value set to [text].
  final String text;

  /// [textColor] is the color of the text which is displayed on [MBButton].
  /// By default it is set to [Colors.white]
  final Color? textColor;

  /// [buttonColor] is the color of the [MBButton].
  /// By default it is set to [Colors.blue]
  final Color? buttonColor;

  /// [icon] is of type [IconData]. The [icon] is displayed along with the [text]
  /// on [MBButton]. Since this is a required field, there is no default value for it.
  final IconData? icon;

  /// [isIconButton] is a [bool]
  /// If [isIconButton] is set false, then the [MBElevatedButton] is returned.
  /// And if [isIconButton] is set true, then the [MBElevatedIconButton] is returned
  final bool isIconButton;

  /// The [verticalPadding] is the [Padding] value in the vertical direction of the widget,
  /// i.e, the widget is padded left and right with this value.
  ///
  /// [Default] value is set to 35.
  final double? verticalPadding;

  /// The [horizontalPadding] is the [Padding] value in the horizontal direction of the widget,
  /// i.e, the widget is padded above and below with this value.
  ///
  /// [Default] value is set to 35.
  final double? horizontalPadding;

  /// [roundness] is the smoothness of the [MBButton]'s edge.
  /// The variable type of [roundness] is double.
  /// By default it is set to [zero]
  final double? roundness;

  /// [elevation] is the vertical distance from the [Scaffold] body of your application
  /// to the [MBButton] widget.
  /// A minimal amount with respect to screen size is recommended for great output.
  final double? elevation;

  /// [onTapFunction] is the function which [MBElevatedIconButton] has to do
  /// when the [MBButton] is tapped.
  /// This is also the [required] field, so there is no default value to it.
  final Function() onTapFunction;

  /// [MBButton] decides it's child with the [isIconButton] value.
  /// If [isIconButton] true then [MBButton]'s child is set to [MBElevatedIconButton]
  /// and [MBElevatedButton] if set to false.
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

/// [_MBButtonState] extends itself from the State of [MBButton].
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
      // If isIconButton is set to true then MBButton's child will be
      // MBElevatedButton or else it is MBElevatedIconButton.
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
              icon: widget.icon ?? Icons.add,
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
