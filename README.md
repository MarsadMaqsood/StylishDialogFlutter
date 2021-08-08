# stylish_dialog

Stylish Alert Dialogs for Flutter.

<img src="https://github.com/MarsadMaqsood/StylishDialogFlutter/blob/master/assets/stylish_dialog-screen%20recording.gif" alt="alt text" width="300" height="620">

## ⭐  Installing

    dependencies:
        stylish_dialog: ^0.0.4
        
## ⚡ Import
    import 'package:stylish_dialog/stylish_dialog.dart';
    
## 📙 How To Use

    context:
    alertType:
    titleText:
    contentText:
    confirmText:
    cancelText:
    confirmPressEvent:
    cancelPressEvent:

#### Prperties
`context → BuildContext`

`alertType → int`

`titleText → String`

`contentText → String`

`confirmText → String`

`cancelText → String`

`confirmPressEvent → void Function ()`

`cancelPressEvent → void Function ()`

    
#### Alert Type
    StylishDialog.NORMAL
    StylishDialog.PROGRESS
    StylishDialog.SUCCESS
    StylishDialog.INFO
    StylishDialog.WARNING
    StylishDialog.ERROR
    
#### Press Event
    confirmPressEvent: (){
        
    }
    
    cancelPressEvent: (){
        
    }
    
### Simple Dialog
Simple Stylish Dialog with title and content text

    StylishDialog(
        context: context,
        alertType: StylishDialog.NORMAL,
        titleText: 'This is title',
        contentText: 'This is content text',
    );
    
### Progress Dialog
Progress dialog without title and content text

    StylishDialog(
        context: context,
        alertType: StylishDialog.PROGRESS,
        titleText: 'This is title',
        contentText: 'This is content text',
    );
    
Progress dialog with only title

    StylishDialog(
        context: context,
        alertType: StylishDialog.PROGRESS,
        titleText: 'This is title',
        contentText: 'This is content text',
    );
    
Progress dialog with title and content text
    
    StylishDialog(
        context: context,
        alertType: StylishDialog.PROGRESS,
        titleText: 'This is title',
        contentText: 'This is content text',
    );

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
    
### Success Dialog 
Success Dialog with click

    StylishDialog(
        context: context,
        alertType: StylishDialog.SUCCESS,
        titleText: 'Wow',
        contentText: 'You did it',
        confirmText: 'Dismiss',
        confirmPressEvent: () {
            //Dismiss stylish dialog
            Navigator.of(context).pop();
        },
    );

    