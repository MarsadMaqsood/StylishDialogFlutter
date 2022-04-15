// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:stylish_dialog/stylish_dialog.dart';

class StylishDialogExamples extends StatefulWidget {
  const StylishDialogExamples({Key? key}) : super(key: key);

  @override
  _StylishDialogExamplesState createState() => _StylishDialogExamplesState();
}

class _StylishDialogExamplesState extends State<StylishDialogExamples> {
  var controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.clear)),
              ),
              const Center(
                child: Text(
                  'Simple message dialog',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextButton(
                onPressed: () {
                  StylishDialog(
                    context: context,
                    alertType: StylishDialogType.NORMAL,
                    titleText: 'Hey',
                    contentText: 'This is simple dialog',
                  ).show();
                },
                child: const Text(
                  'Show Me',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(160, 44)),
                  backgroundColor: MaterialStateProperty.all(
                    Colors.teal,
                  ),
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              const Text(
                'Progress dialog with title',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 8,
              ),
              TextButton(
                onPressed: () {
                  StylishDialog(
                    context: context,
                    alertType: StylishDialogType.PROGRESS,
                    titleText: 'Processing...',
                  ).show();
                },
                child: const Text(
                  'Show Me',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(160, 44)),
                  backgroundColor: MaterialStateProperty.all(
                    Colors.teal,
                  ),
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              const Text(
                'Success Dialog with title',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 8,
              ),
              TextButton(
                onPressed: () {
                  StylishDialog(
                    context: context,
                    alertType: StylishDialogType.SUCCESS,
                    titleText: 'Wow',
                  ).show();
                },
                child: const Text(
                  'Show Me',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(160, 44)),
                  backgroundColor: MaterialStateProperty.all(
                    Colors.teal,
                  ),
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              const Text(
                'Success dialog with title and content text',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 8,
              ),
              TextButton(
                onPressed: () {
                  StylishDialog(
                    context: context,
                    alertType: StylishDialogType.SUCCESS,
                    titleText: 'Wow',
                    contentText: 'You did it',
                  ).show();
                },
                child: const Text(
                  'Show Me',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(160, 44)),
                  backgroundColor: MaterialStateProperty.all(
                    Colors.teal,
                  ),
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              const Text(
                'Info dialog with title',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 8,
              ),
              TextButton(
                onPressed: () {
                  StylishDialog(
                    context: context,
                    alertType: StylishDialogType.INFO,
                    titleText: 'Wait',
                  ).show();
                },
                child: const Text(
                  'Show Me',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(160, 44)),
                  backgroundColor: MaterialStateProperty.all(
                    Colors.teal,
                  ),
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              const Text(
                'Info dialog with title and content text',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 8,
              ),
              TextButton(
                onPressed: () {
                  StylishDialog(
                    context: context,
                    alertType: StylishDialogType.INFO,
                    titleText: 'You know',
                    contentText: 'Sun rises in the east',
                  ).show();
                },
                child: const Text(
                  'Show Me',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(160, 44)),
                  backgroundColor: MaterialStateProperty.all(
                    Colors.teal,
                  ),
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              const Text(
                'Warning dialog with title and content text',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 8,
              ),
              TextButton(
                onPressed: () {
                  StylishDialog(
                    context: context,
                    alertType: StylishDialogType.WARNING,
                    titleText: 'Wait',
                    contentText: 'Are you sure you want to do this',
                  ).show();
                },
                child: const Text(
                  'Show Me',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(160, 44)),
                  backgroundColor: MaterialStateProperty.all(
                    Colors.teal,
                  ),
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              const Text(
                'Error dialog with title and content text',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 8,
              ),
              TextButton(
                onPressed: () {
                  StylishDialog(
                    context: context,
                    alertType: StylishDialogType.ERROR,
                    titleText: 'Opps',
                    contentText: 'Task failed to complete',
                  ).show();
                },
                child: const Text(
                  'Show Me',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(160, 44)),
                  backgroundColor: MaterialStateProperty.all(
                    Colors.teal,
                  ),
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              const Text(
                'Dialog with custom view',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 8,
              ),
              TextButton(
                onPressed: () {
                  StylishDialog(
                      context: context,
                      alertType: StylishDialogType.NORMAL,
                      titleText: 'Name',
                      contentText: 'Please enter your name',
                      confirmText: 'Submit',
                      confirmPressEvent: () {
                        print(controller.text);
                      },
                      addView: TextField(
                        controller: controller,
                        decoration: const InputDecoration(),
                      )).show();
                },
                child: const Text(
                  'Show Me',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(160, 44)),
                  backgroundColor: MaterialStateProperty.all(
                    Colors.teal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
