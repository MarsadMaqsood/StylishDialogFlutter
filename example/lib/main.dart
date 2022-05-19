import 'package:flutter/material.dart';
import 'package:stylish_dialog/stylish_dialog.dart';

import 'stylish_dialog_examples.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stylish Dialog Example',
      theme: ThemeData(
        // useMaterial3: true,
        primarySwatch: Colors.teal,
      ),
      home: const StylishExample(),
    );
  }
}

class StylishExample extends StatefulWidget {
  const StylishExample({Key? key}) : super(key: key);

  @override
  State<StylishExample> createState() => _StylishExampleState();
}

class _StylishExampleState extends State<StylishExample> {
  //Dialog Controller
  DialogController controller = DialogController(
    listener: (status) {
      if (status == DialogStatus.Showing) {
        debugPrint("Dialog is showing");
      } else if (status == DialogStatus.Changed) {
        debugPrint("Dialog type changed");
      } else if (status == DialogStatus.Dismissed) {
        debugPrint("Dialog dismissed");
      }
    },
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const Center(
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
                      alertType: StylishDialogType.PROGRESS,
                      titleText: 'Processing...',
                      dismissOnTouchOutside: false,
                      controller: controller,
                      // backgroundColor: Colors.purple,
                      // style: Style.Style1,
                    );
                    dialog.show();

                    Future.delayed(const Duration(seconds: 3), () {
                      dialog.changeAlertType(
                        alertType: StylishDialogType.SUCCESS,
                        titleText: 'Congrats!',
                        contentText: 'Task completed successfuly',

                        /// Deprecated
                        ///
                        /// ```dart
                        ///
                        /// confirmText: 'Dismiss',
                        /// confirmPressEvent: () {
                        ///   dialog.dismiss();
                        /// },
                        ///
                        /// cancelText: 'Not now',
                        /// cancelPressEvent: () {},
                        ///
                        /// ```

                        //Use `confirmButton` now
                        confirmButton: TextButton(
                          onPressed: () {
                            dialog.dismiss();
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.teal),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(4),
                            child: Text(
                              'Dismiss',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      );
                    });
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(160, 44)),
                    backgroundColor: MaterialStateProperty.all(
                      Colors.teal,
                    ),
                  ),
                  child: const Text(
                    'Show Me',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Positioned.fill(
              bottom: 20,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const StylishDialogExamples()));
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(160, 42)),
                    backgroundColor: MaterialStateProperty.all(
                      Colors.teal,
                    ),
                  ),
                  child: const Text(
                    'More Examples',
                    style: TextStyle(color: Colors.white, fontSize: 16),
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
