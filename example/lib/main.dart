import 'package:flutter/material.dart';
import 'package:stylish_dialog/stylish_dialog.dart';

import 'StylishDialogExamples.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stylish Dialog Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StylishExample(),
    );
  }
}

class StylishExample extends StatefulWidget {
  const StylishExample({Key? key}) : super(key: key);

  @override
  _StylishExampleState createState() => _StylishExampleState();
}

class _StylishExampleState extends State<StylishExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Text(
                'Simple dialog bind with success dialog',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Positioned.fill(
              top: 80,
              child: Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    StylishDialog dialog = StylishDialog(
                      context: context,
                      alertType: StylishDialog.PROGRESS,
                      titleText: 'Processing...',
                      dismissOnTouchOutside: false,
                    );
                    dialog.show();

                    Future.delayed(Duration(seconds: 3), () {
                      dialog.changeAlertType(
                        alertType: StylishDialog.SUCCESS,
                        titleText: 'Congrats!',
                        contentText: 'Task completed successfuly',
                        confirmPressEvent: () {
                          dialog.dismiss();
                        },
                        confirmText: 'Dismiss',
                      );
                    });
                  },
                  child: Text(
                    'Show Me',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(160, 44)),
                    backgroundColor: MaterialStateProperty.all(
                      Colors.teal,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Positioned.fill(
              bottom: 20,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => StylishDialogExamples()));
                  },
                  child: Text(
                    'More Examples',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(160, 42)),
                    backgroundColor: MaterialStateProperty.all(
                      Colors.teal,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
