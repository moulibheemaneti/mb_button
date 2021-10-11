/// [MBElevatedButton] is called when the [isIconButton] of [MBButton] is set to false.
import 'package:flutter/material.dart';

/// [MBElevatedButton] is a [StatefulWidget] which takes [elevation],
/// [roundness], [buttonColor], [textColor], [text] and [onTapFunction]
/// as it's arguments.
class MBElevatedButton extends StatefulWidget {
  /// [elevation] is the vertical distance from the [Scaffold] body of your application
  /// to the [MBElevatedButton] widget.
  /// A minimal amount with respect to screen size is recommended for great output.
  final double? elevation;

  /// [roundness] is the smoothness of the [MBElevatedButton]'s edge.
  /// The variable type of [roundness] is double.
  /// By default it is set to [zero]
  final double? roundness;

  /// [buttonColor] is the color of the [MBElevatedButton].
  /// By default it is set to [Colors.blue]
  final Color? buttonColor;

  /// [textColor] is the color of the text which is displayed on [MBElevatedButton].
  /// By default it is set to [Colors.white]
  final Color? textColor;

  /// [text] is the value of the text which is displayed on [MBElevatedButton].
  /// This is the [required] field, so there is no default value to it.
  final String text;

  /// [onTapFunction] is the function which [MBElevatedButton] has to do
  /// when the [MBButton] is tapped.
  /// This is also the [required] field, so there is no default value to it.
  final Function() onTapFunction;

  /// Without [text] and [onTapFunction] a [MBElevatedButton] doesn't exist.
  const MBElevatedButton({
    Key? key,
    this.elevation,
    this.roundness,
    this.buttonColor,
    this.textColor,
    required this.text,
    required this.onTapFunction,
  }) : super(key: key);

  @override
  _MBElevatedButtonState createState() => _MBElevatedButtonState();
}

/// [_MBElevatedButtonState] is a [State] widget of [MBElevatedButton].
/// This returns a [ElevatedButton] widget.
class _MBElevatedButtonState extends State<MBElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        // Default [elevation] is 5
        elevation: widget.elevation ?? 5.0,

        // Default [primary] color is Colors.blue
        // [primary] means the color of the button.
        primary: widget.buttonColor ?? Colors.blue,

        // Default onPrimary color is Colors.blue
        // onPrimary means, on the button.
        // So onPrimary refers to the [Color] of text displayed on the button.
        onPrimary: widget.textColor ?? Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            // The shape of this button is circluar and it has no roundess by default.
            // If entered, then the roundess is set to that value
            widget.roundness ?? 0,
          ),
        ),
      ),

      // When the button is pressed, [widget.onTapFunction] is invoked.
      onPressed: widget.onTapFunction,
      child: Text(
        widget.text,
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
