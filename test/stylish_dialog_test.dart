import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stylish_dialog/src/stylish_dialog_ui.dart';

import 'package:stylish_dialog/stylish_dialog.dart';

void main() {
  group("StylishDialog", () {
    testWidgets('Normal Test', (WidgetTester tester) async {
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            Widget testWidget = new MediaQuery(
                data: new MediaQueryData(),
                child: new MaterialApp(
                    home: new StylishDialogUI(
                        alertType: StylishDialog.NORMAL, context: context)));
            return testWidget;
          },
        ),
      );
    });

    testWidgets('Progress Test', (WidgetTester tester) async {
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            Widget testWidget = new MediaQuery(
                data: new MediaQueryData(),
                child: new MaterialApp(
                    home: new StylishDialogUI(
                  context: context,
                  alertType: StylishDialog.PROGRESS,
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
            Widget testWidget = new MediaQuery(
                data: new MediaQueryData(),
                child: new MaterialApp(
                    home: new StylishDialogUI(
                  alertType: StylishDialog.SUCCESS,
                  context: context,
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
            Widget testWidget = new MediaQuery(
                data: new MediaQueryData(),
                child: new MaterialApp(
                  home: new StylishDialogUI(
                    context: context,
                    alertType: StylishDialog.INFO,
                    titleText: 'You know',
                    contentText: 'This is an amazing dialog',
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
            Widget testWidget = new MediaQuery(
                data: new MediaQueryData(),
                child: new MaterialApp(
                  home: new StylishDialogUI(
                    context: context,
                    alertType: StylishDialog.WARNING,
                    titleText: 'Wait',
                    contentText: 'Are you sure you want to delete',
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
            Widget testWidget = new MediaQuery(
                data: new MediaQueryData(),
                child: new MaterialApp(
                    home: new StylishDialogUI(
                  context: context,
                  alertType: StylishDialog.ERROR,
                  titleText: 'Oops',
                  contentText: 'Task Failed',
                )));
            return testWidget;
          },
        ),
      );
    });

    testWidgets('Simple D Bind With Success Test', (WidgetTester tester) async {
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            Widget testWidget = new MediaQuery(
              data: new MediaQueryData(),
              child: new MaterialApp(
                home: ElevatedButton(
                  onPressed: () {
                    StylishDialog dialog = StylishDialog(
                        context: context,
                        alertType: StylishDialog.PROGRESS,
                        titleText: 'Processing...');
                    dialog.show();

                    Future.delayed(Duration(seconds: 5), () {
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
                  child: Text('Show'),
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
