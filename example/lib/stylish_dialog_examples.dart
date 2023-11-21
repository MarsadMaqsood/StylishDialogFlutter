// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:stylish_dialog/stylish_dialog.dart';

class StylishDialogExamples extends StatefulWidget {
  const StylishDialogExamples({super.key});

  @override
  State<StylishDialogExamples> createState() => _StylishDialogExamplesState();
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
                    title: const Text('Hey'),
                    content: const Text('This is simple dialog'),
                  ).show();
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
                    title: const Text('Processing...'),
                  ).show();
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
                    title: const Text('Wow'),
                  ).show();
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
                    title: const Text('Wow'),
                    content: const Text('You did it'),
                  ).show();
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
                    title: const Text('Wait'),
                  ).show();
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
                    title: const Text('You know'),
                    content: const Text('Sun rises in the east'),
                  ).show();
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
                    title: const Text('Wait'),
                    content: const Text('Are you sure you want to do this'),
                  ).show();
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
                    title: const Text('Opps'),
                    content: const Text('Task failed to complete'),
                  ).show();
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
                      title: const Text('Name'),
                      content: const Text('Please enter your name'),
                      confirmButton: TextButton(
                        onPressed: () {
                          debugPrint(controller.text);
                        },
                        child: const Text('Submit'),
                      ),
                      style: Style1(),
                      addView: SizedBox(
                        width: 400,
                        child: TextField(
                          controller: controller,
                          decoration: const InputDecoration(),
                        ),
                      )).show();
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
              const SizedBox(
                height: 28,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
