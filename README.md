# stylish_dialog

Stylish Alert Dialogs for Flutter.

## ⭐  Installing

    dependencies:
        stylish_dialog: ^0.0.3
        
## ⚡ Import
    import 'package:stylish_dialog/stylish_dialog.dart';
    
## 📙 How To Use

    context:
    alertType:
    titleText:
    contentText:
    
#### Alert Type
    StylishDialog.NORMAL
    StylishDialog.PROGRESS
    StylishDialog.SUCCESS
    StylishDialog.INFO
    StylishDialog.WARNING
    StylishDialog.ERROR
    
### Simple Dialog
Simple Stylish Dialog with title and content text

    StylishDialog(
        context: context,
        alertType: StylishDialog.NORMAL,
        titleText: 'This is title',
        contentText: 'This is content text',
    );
    
### Progress Dialog


### Success Dialog
Success dialog without title and content text
    
    StylishDialog(
        context: context,
        alertType: StylishDialog.SUCCESS,
    );
    
Success dialog with only title

    StylishDialog(
        context: context,
        alertType: StylishDialog.SUCCESS,
        titleText: 'Wow',
    );

Success Dialog with title and content text

    StylishDialog(
        context: context,
        alertType: StylishDialog.SUCCESS,
        titleText: 'Wow',
        contentText: 'Task completed',
    );
    
### Info Dialog
Info Dialog without title and content text

    StylishDialog(
        context: context,
        alertType: StylishDialog.INFO,
    ),
    

Info Dialog with only title

    StylishDialog(
        context: context,
        alertType: StylishDialog.INFO,
        titleText: 'You know',
    ),

Info Dialog with title and content text

    StylishDialog(
        context: context,
        alertType: StylishDialog.INFO,
        titleText: 'You know',
        contentText: 'This is an amazing dialog',
    ),

### Warning Dialog
Warning Dialog without title and content text

    StylishDialog(
        context: context,
        alertType: StylishDialog.WARNING,
    );

Warning Dialog with only title

    StylishDialog(
        context: context,
        alertType: StylishDialog.WARNING,
        titleText: 'Wait',
    );


Warning Dialog with title and content text
    
    StylishDialog(
        context: context,
        alertType: StylishDialog.WARNING,
        titleText: 'Wait',
        contentText: 'Are you sure you want to delete',
    );
    
### Error Dialog
Error Dialog without title and content text

    StylishDialog(
        context: context,
        alertType: StylishDialog.ERROR,
    );

Error Dialog with only title

    StylishDialog(
        context: context,
        alertType: StylishDialog.ERROR,
        titleText: 'Oops',
    );

Error Dialog with title and content text

    StylishDialog(
        context: context,
        alertType: StylishDialog.ERROR,
        titleText: 'Oops',
        contentText: 'Task Failed',
    );
    