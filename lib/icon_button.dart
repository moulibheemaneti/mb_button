/// [MBElevatedIconButton] is called when the [isIconButton] of [MBButton] is set to true.
import 'package:flutter/material.dart';

/// [MBElevatedIconButton] is a [StatefulWidget] which takes [elevation],
/// [roundness], [buttonColor], [textColor], [icon], [text] and [onTapFunction]
/// as it's arguments.
class MBElevatedIconButton extends StatefulWidget {
  /// [elevation] is the vertical distance from the [Scaffold] body of your application
  /// to the [MBElevatedIconButton] widget.
  /// A minimal amount with respect to screen size is recommended for great output.
  final double? elevation;

  /// [roundness] is the smoothness of the [MBElevatedIconButton]'s edge.
  /// The variable type of [roundness] is double.
  /// By default it is set to [zero]
  final double? roundness;

  /// [buttonColor] is the color of the [MBElevatedIconButton].
  /// By default it is set to [Colors.blue]
  final Color? buttonColor;

  /// [textColor] is the color of the text which is displayed on [MBElevatedIconButton].
  /// By default it is set to [Colors.white]
  final Color? textColor;

  /// [icon] is of type [IconData]. This field is required for an [MBElevatedIconButton].
  /// [icon] is displayed on [MBElevatedIconButton] along with [text].
  /// Since this is a required field, there is no default value for it.
  final IconData icon;

  /// [text] is the value of the text which is displayed on [MBElevatedIconButton].
  /// This is the required field, so there is no default value to it.
  final String text;

  /// [onTapFunction] is the function which [MBElevatedIconButton] has to do
  /// when the [MBButton] is tapped.
  /// This is also the required field, so there is no default value to it.
  final Function()? onTapFunction;

  /// Without [icon],[text] and [onTapFunction] a [MBElevatedButton] doesn't exist.
  const MBElevatedIconButton({
    Key? key,
    this.elevation,
    this.roundness,
    this.buttonColor,
    this.textColor,
    required this.icon,
    required this.text,
    required this.onTapFunction,
  }) : super(key: key);

  @override
  _MBElevatedIconButtonState createState() => _MBElevatedIconButtonState();
}

/// [_MBElevatedIconButtonState] is a [State] widget of [MBElevatedIconButton].
/// This returns a [ElevatedButton.icon] widget.
class _MBElevatedIconButtonState extends State<MBElevatedIconButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      label: Text(
        widget.text,
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      icon: Icon(widget.icon),
      style: ElevatedButton.styleFrom(
        // Default [elevation] is 5
        elevation: widget.elevation ?? 5.0,

        // Default [primary] color is Colors.blue
        // [primary] means the color of the button.
        backgroundColor: widget.buttonColor ?? Colors.blue,

        // Default onPrimary color is Colors.blue
        // onPrimary means, on the button.
        // So onPrimary refers to the [Color] of text displayed on the button.
        foregroundColor: widget.textColor ?? Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            // The shape of this button is circluar and it has no roundess by default.
            // If entered, then the roundess is set to that value
            widget.roundness ?? 0,
          ),
        ),
      ),

      /// When the button is pressed, [widget.onTapFunction] is called.
      onPressed: widget.onTapFunction,
    );
  }
}
