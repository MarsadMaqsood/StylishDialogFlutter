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
                    icon: Icon(Icons.clear)),
              ),
              Center(
                child: Text(
                  'Simple message dialog',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextButton(
                onPressed: () {
                  StylishDialog(
                    context: context,
                    alertType: StylishDialog.NORMAL,
                    titleText: 'Hey',
                    contentText: 'This is simple dialog',
                  )..show();
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
              SizedBox(
                height: 28,
              ),
              Text(
                'Progress dialog with title',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 8,
              ),
              TextButton(
                onPressed: () {
                  StylishDialog(
                    context: context,
                    alertType: StylishDialog.PROGRESS,
                    titleText: 'Processing...',
                  )..show();
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
              SizedBox(
                height: 28,
              ),
              Text(
                'Success Dialog with title',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 8,
              ),
              TextButton(
                onPressed: () {
                  StylishDialog(
                    context: context,
                    alertType: StylishDialog.SUCCESS,
                    titleText: 'Wow',
                  )..show();
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
              SizedBox(
                height: 28,
              ),
              Text(
                'Success dialog with title and content text',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 8,
              ),
              TextButton(
                onPressed: () {
                  StylishDialog(
                    context: context,
                    alertType: StylishDialog.SUCCESS,
                    titleText: 'Wow',
                    contentText: 'You did it',
                  )..show();
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
              SizedBox(
                height: 28,
              ),
              Text(
                'Info dialog with title',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 8,
              ),
              TextButton(
                onPressed: () {
                  StylishDialog(
                    context: context,
                    alertType: StylishDialog.INFO,
                    titleText: 'Wait',
                  )..show();
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
              SizedBox(
                height: 28,
              ),
              Text(
                'Info dialog with title and content text',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 8,
              ),
              TextButton(
                onPressed: () {
                  StylishDialog(
                    context: context,
                    alertType: StylishDialog.INFO,
                    titleText: 'You know',
                    contentText: 'Sun rises in the east',
                  )..show();
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
              SizedBox(
                height: 28,
              ),
              Text(
                'Warning dialog with title and content text',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 8,
              ),
              TextButton(
                onPressed: () {
                  StylishDialog(
                    context: context,
                    alertType: StylishDialog.WARNING,
                    titleText: 'Wait',
                    contentText: 'Are you sure you want to do this',
                  )..show();
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
              SizedBox(
                height: 28,
              ),
              Text(
                'Error dialog with title and content text',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 8,
              ),
              TextButton(
                onPressed: () {
                  StylishDialog(
                    context: context,
                    alertType: StylishDialog.ERROR,
                    titleText: 'Opps',
                    contentText: 'Task failed to complete',
                  )..show();
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
              SizedBox(
                height: 28,
              ),
              Text(
                'Dialog with custom view',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 8,
              ),
              TextButton(
                onPressed: () {
                  StylishDialog(
                      context: context,
                      alertType: StylishDialog.NORMAL,
                      titleText: 'Name',
                      contentText: 'Please enter your name',
                      confirmText: 'Submit',
                      confirmPressEvent: () {
                        print(controller.text);
                      },
                      addView: TextField(
                        controller: controller,
                        decoration: InputDecoration(),
                      ))
                    ..show();
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
            ],
          ),
        ),
      ),
    );
  }
}
