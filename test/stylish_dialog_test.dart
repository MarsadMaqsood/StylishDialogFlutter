// ignore_for_file: deprecated_member_use_from_same_package

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stylish_dialog/src/stylish_dialog_ui.dart';
import 'package:stylish_dialog/stylish_dialog.dart';

void main() {
  group("StylishDialog Test", () {
    testWidgets('Normal Test', (WidgetTester tester) async {
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            Widget testWidget = MediaQuery(
                data: const MediaQueryData(),
                child: MaterialApp(
                    home: StylishDialogUI(
                        alertType: StylishDialogType.NORMAL,
                        context: context)));
            return testWidget;
          },
        ),
      );
    });

    testWidgets('Progress Test', (WidgetTester tester) async {
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            Widget testWidget = MediaQuery(
                data: const MediaQueryData(),
                child: MaterialApp(
                    home: StylishDialogUI(
                  context: context,
                  alertType: StylishDialogType.PROGRESS,
                  titleText: 'This is title',
                  contentText: 'This is content text',
                )));
            return testWidget;
          },
        ),
      );
    });

    testWidgets('Success Test', (WidgetTester tester) async {
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            Widget testWidget = MediaQuery(
                data: const MediaQueryData(),
                child: MaterialApp(
                    home: StylishDialogUI(
                  alertType: StylishDialogType.SUCCESS,
                  context: context,
                  animationLoop: false,
                  titleText: 'Wow',
                  contentText: 'Task completed',
                )));
            return testWidget;
          },
        ),
      );
    });

    testWidgets('Info Test', (WidgetTester tester) async {
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            Widget testWidget = MediaQuery(
                data: const MediaQueryData(),
                child: MaterialApp(
                  home: StylishDialogUI(
                    context: context,
                    alertType: StylishDialogType.INFO,
                    titleText: 'You know',
                    contentText: 'This is an amazing dialog',
                    animationLoop: false,
                  ),
                ));
            return testWidget;
          },
        ),
      );
    });

    testWidgets('Warning Test', (WidgetTester tester) async {
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            Widget testWidget = MediaQuery(
                data: const MediaQueryData(),
                child: MaterialApp(
                  home: StylishDialogUI(
                    context: context,
                    alertType: StylishDialogType.WARNING,
                    titleText: 'Wait',
                    contentText: 'Are you sure you want to delete',
                    animationLoop: false,
                  ),
                ));
            return testWidget;
          },
        ),
      );
    });

    testWidgets('Error Test', (WidgetTester tester) async {
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            Widget testWidget = MediaQuery(
                data: const MediaQueryData(),
                child: MaterialApp(
                    home: StylishDialogUI(
                  context: context,
                  alertType: StylishDialogType.ERROR,
                  titleText: 'Oops',
                  contentText: 'Task Failed',
                  animationLoop: false,
                )));
            return testWidget;
          },
        ),
      );
    });

    testWidgets('Simple D. Bind With Success Test',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            Widget testWidget = MediaQuery(
              data: const MediaQueryData(),
              child: MaterialApp(
                home: ElevatedButton(
                  onPressed: () {
                    StylishDialog dialog = StylishDialog(
                      context: context,
                      alertType: StylishDialogType.PROGRESS,
                      titleText: 'Processing...',
                      animationLoop: false,
                    );
                    dialog.show();

                    Future.delayed(const Duration(seconds: 5), () {
                      dialog.changeAlertType(
                        alertType: StylishDialogType.SUCCESS,
                        titleText: 'Congrats!',
                        contentText: 'Task completed successfuly',
                        confirmPressEvent: () {
                          dialog.dismiss();
                        },
                        confirmText: 'Dismiss',
                      );
                    });
                  },
                  child: const Text('Show'),
                ),
              ),
            );
            return testWidget;
          },
        ),
      );
    });

    var controller = TextEditingController();

    testWidgets('Custom widget dialog', (WidgetTester tester) async {
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            Widget testWidget = MediaQuery(
              data: const MediaQueryData(),
              child: MaterialApp(
                home: ElevatedButton(
                  onPressed: () {
                    StylishDialog dialog = StylishDialog(
                        context: context,
                        alertType: StylishDialogType.NORMAL,
                        addView: TextField(
                          controller: controller,
                          decoration: const InputDecoration(
                              hintText: 'Enter your name'),
                        ),
                        confirmText: 'Submit',
                        confirmPressEvent: () {
                          print(controller.text);
                        },
                        titleText: 'Name',
                        animationLoop: false);
                    dialog.show();
                  },
                  child: const Text('Show'),
                ),
              ),
            );
            return testWidget;
          },
        ),
      );
    });
  });
}
