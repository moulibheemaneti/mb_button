/// Ensure you use the below two packages in the file which you are working on
import 'package:flutter/material.dart';
import 'package:mb_button/mb_button.dart';

void main() {
  runApp(const MyApp());
}

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

class MBButtonDemo extends StatefulWidget {
  const MBButtonDemo({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MBButtonDemoState createState() => _MBButtonDemoState();
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
            MBButton(
              text: "Click Here",
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
