import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

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
                    home: new StylishDialog(
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
                    home: new StylishDialog(
                  context: context,
                  alertType: StylishDialog.NORMAL,
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
                    home: new StylishDialog(
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
                  home: new StylishDialog(
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
                  home: new StylishDialog(
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
                    home: new StylishDialog(
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
  });
}
