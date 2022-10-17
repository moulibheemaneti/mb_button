/// Ensure you use the below two packages in the file which you are working on
import 'package:flutter/material.dart';
import 'package:mb_button/mb_button.dart';

/// Entry point of the application
void main() {
  runApp(const MyApp());
}

/// Base for the whole app.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MB Button Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MBButtonDemo(title: 'MB Button Demo'),
    );
  }
}

/// MBButton Demo class show the demo of the usage of this package - `mb_button`.
class MBButtonDemo extends StatefulWidget {
  const MBButtonDemo({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<MBButtonDemo> createState() => _MBButtonDemoState();
}

class _MBButtonDemoState extends State<MBButtonDemo> {
  /// late modifier ensures that the variable _counter wait till it gets initialized.
  late int _counter;

  @override
  void initState() {
    /// Everytime the application is reset, _counter is set to 0.
    _counter = 0;
    super.initState();
  }

  /// This function '_incrementCounter' Increments the _counter by 1
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /// Fetches the title from it's parent widget.
        title: Text(widget.title.toString()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /// Use of MBButton
            /// This is elevated button without an icon on it.
            MBButton(
              text: "Add",
              onTapFunction: _incrementCounter,
              textColor: Colors.white,
              buttonColor: Colors.black12,
              verticalPadding: 40,
              horizontalPadding: 40,
              roundness: 50,
              elevation: 3,
            ),

            /// Use of MBButton
            /// This is elevated button with an icon on it.
            MBButton(
              isIconButton: true,
              // Ensure that you add icon argument whenever
              // [isIconButton] is set [true].
              icon: Icons.add,
              text: "Add",
              onTapFunction: _incrementCounter,
              textColor: Colors.white,
              buttonColor: Colors.black12,
              verticalPadding: 40,
              horizontalPadding: 40,
              roundness: 50,
              elevation: 3,
            ),

            /// Display the value on the screen
            Text(
              "$_counter",
              style: const TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
