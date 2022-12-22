# stylish_dialog

[![Hello](https://img.shields.io/badge/Hello-Sweet%20World-teal)](https://github.com/MarsadMaqsood) [![StylishDialog](https://img.shields.io/badge/Flutter-Stylish%20Dialog-blueviolet)](https://pub.dev/packages/stylish_dialog) [![Version](https://img.shields.io/pub/v/stylish_dialog?color=%2354C92F&logo=dart)](https://pub.dev/packages/stylish_dialog/install) 

[![Normal](https://img.shields.io/badge/Alert%20Type-Normal-ff69b4)](#simple-dialog) [![Progress](https://img.shields.io/badge/Alert%20Type-Progress-yellowgreen)](#progress-dialog) [![Success](https://img.shields.io/badge/Alert%20Type-Success-success)](#success-dialog) [![Info](https://img.shields.io/badge/Alert%20Type-Info-blue)](#info-dialog) [![Warning](https://img.shields.io/badge/Alert%20Type-Warning-orange)](#warning-dialog) [![Error](https://img.shields.io/badge/Alert%20Type-Error-red)](#error-dialog)


A collection of stylish animated dialogs like Normal, Progress, Success, Info, Warning, and Error for flutter.

## Showcase
<img src="https://raw.githubusercontent.com/MarsadMaqsood/StylishDialogFlutter/master/assets/showcase.gif" width="300" height="620">

## ⭐  Installing

```yaml
dependencies:
    stylish_dialog: ^1.0.2
```
## ⚡ Import

```dart
import 'package:stylish_dialog/stylish_dialog.dart';
```

## 📙 How To Use

```dart
context:
alertType:
controller:
title:
content:
addView:
confirmButton:
cancelButton:
dismissOnTouchOutside:
animationLoop:
progressColor:
backgroundColor:
@deprecated confirmText:
@deprecated cancelText:
@deprecated confirmPressEvent:
@deprecated cancelPressEvent:
```

## Properties

```dart
context → BuildContext

alertType → StylishDialogType

controller → DialogController

title → Widget

content → Widget

addView → Widget

confirmText → String

cancelText → String

confirmButton → Widget

cancelButton → Widget

animationLoop → bool

style → Style

progressColor → Color

backgroundColor → Color

confirmPressEvent → void Function()

cancelPressEvent → void Function()

dismissOnTouchOutside → bool

rootNavigator → bool

preferedStyle → PreferedStyle
```

## Alert Type

```dart
StylishDialogType.NORMAL
StylishDialogType.PROGRESS
StylishDialogType.SUCCESS
StylishDialogType.INFO
StylishDialogType.WARNING
StylishDialogType.ERROR
```

## Dialog Style

```dart
Style.Default
Style.Style1
```

## PreferedStyle

```dart
PreferedStyle.Android
PreferedStyle.IOS
PreferedStyle.System
```

### Adaptive Dialog

```dart
showAdaptiveDialog(
    context: context,
    builder: (context) => AdaptiveDialog(
        //preferedStyle: PreferedStyle.IOS,
        title: const Text('Title'),
        content: const Text('This is example dialog'),
        actions: [
            TextButton(
                onPressed: () {}, child: const Text('Confirm')),
            TextButton(
                onPressed: () {}, child: const Text('Cancel')),
            ],
    ),
);
```

### Press Event

```dart
///Press events are deprecated and should be replaced with
/// [confirmButton:], [cancelButton:] 
///  To handle clicks you can wrap your widget with
/// [GestureDetector] or [InkWell]
confirmPressEvent: (){
        
}
    
cancelPressEvent: (){
        
}
```

## Bind Dialog/Change Alert Type

```dart
dialog.changeAlertType(
    alertType: /*Alert Type*/,
    ...
);
```

## Controller
```dart
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
```
___

## Examples 

```dart
StylishDialog dialog = StylishDialog(
        context: context,
        alertType: StylishDialogType.SUCCESS,
        controller: controller,
        title: Text('This is title'),
        content: Text('This is content text'),
        animationLoop: true,
    );
        
//show stylish dialog
dialog.show();
    
//dismiss stylish dialog
dialog.dismiss();

//dialog.dismiss(/*rootNavigator: bool  //default true */);

```
___

### Simple Dialog

Simple Stylish Dialog with title and content text

```dart
StylishDialog(
    context: context,
    alertType: StylishDialogType.NORMAL,
    title: Text('This is title'),
    content: Text('This is content text'),
).show();
```

___

### Normal Dialog with Custom Widget
Normal dialog with custom widget
Note: `addView:` is only supported with `StylishDialogType.NORMAL` `alertType`

```dart
StylishDialog(
    context: context,
    alertType: StylishDialogType.NORMAL,
    title: Text('Name'),
    content: Text('Please enter your name'),
    confirmText: 'Submit',
    confirmPressEvent: () {
        print(controller.text);
    },
    addView: TextField(
        controller: controller,
        ),
).show();
```

___
    
### Progress Dialog

Progress dialog without title and content text

```dart
StylishDialog(
    context: context,
    alertType: StylishDialogType.PROGRESS,
    title: Text('This is title'),
    content: Text('This is content text'),
).show();
```

Progress dialog with only title

```dart
StylishDialog(
    context: context,
    alertType: StylishDialogType.PROGRESS,
    title: Text('This is title'),
    content: Text('This is content text'),
).show();
```
    
Progress dialog with title and content text
    
```dart
StylishDialog(
    context: context,
    alertType: StylishDialogType.PROGRESS,
    title: Text('This is title'),
    content: Text('This is content text'),
).show();
```

___

### Success Dialog

Success dialog without title and content text

```dart    
StylishDialog(
    context: context,
    alertType: StylishDialogType.SUCCESS,
).show();
```

Success dialog with only title

```dart
StylishDialog(
    context: context,
    alertType: StylishDialogType.SUCCESS,
    title: Text('Wow'),
).show();
```

Success Dialog with title and content text

```dart
StylishDialog(
    context: context,
    alertType: StylishDialogType.SUCCESS,
    title: Text('Wow'),
    content: Text('Task completed'),
).show();
```
    
___
    
### Info Dialog

Info Dialog without title and content text

```dart
StylishDialog(
    context: context,
    alertType: StylishDialogType.INFO,
).show();
```

Info Dialog with only title

```dart
StylishDialog(
    context: context,
    alertType: StylishDialogType.INFO,
    title: Text('You know'),
).show();
```

Info Dialog with title and content text

```dart
StylishDialog(
    context: context,
    alertType: StylishDialogType.INFO,
    title: Text('You know'),
    content: Text('This is an amazing dialog'),
).show();
```

___

### Warning Dialog

Warning Dialog without title and content text

```dart
StylishDialog(
    context: context,
    alertType: StylishDialogType.WARNING,
).show();
```

Warning Dialog with only title

```dart
StylishDialog(
    context: context,
    alertType: StylishDialogType.WARNING,
    title: Text('Wait'),
).show();
```

Warning Dialog with title and content text
    
```dart
StylishDialog(
    context: context,
    alertType: StylishDialogType.WARNING,
    title: Text('Wait'),
    content: Text('Are you sure you want to delete'),
).show();
```

___

### Error Dialog

Error Dialog without title and content text

```dart
StylishDialog(
    context: context,
    alertType: StylishDialogType.ERROR,
).show();
```

Error Dialog with only title

```dart
StylishDialog(
    context: context,
    alertType: StylishDialogType.ERROR,
    title: Text('Oops'),
).show();
```

Error Dialog with title and content text

```dart
StylishDialog(
    context: context,
    alertType: StylishDialogType.ERROR,
    title: Text('Oops'),
    content: Text('Task Failed'),
).show();
```

___

### Success Dialog 

Success Dialog with click

```dart
StylishDialog(
    context: context,
    alertType: StylishDialogType.SUCCESS,
    title: Text('Wow'),
    content: Text('You did it'),
    confirmText: 'Dismiss',
    confirmPressEvent: () {
        //Dismiss stylish dialog
        Navigator.of(context).pop();
    },
).show();
```

___

    
### Different Ways to bind
Progress dialog binds with Success dialog

```dart
StylishDialog dialog = StylishDialog(
    context: context,
    alertType: StylishDialogType.PROGRESS,
    title: Text('Processing...'),
    dismissOnTouchOutside: false,
    animationLoop: true,
);
dialog.show();

Future.delayed(Duration(seconds: 3), () {
    dialog.changeAlertType(
    alertType: StylishDialogType.SUCCESS,
        title: Text('Congrats!'),
        content: Text('Task completed successfuly'),

        confirmButton: TextButton(
            onPressed: () {
                dialog.dismiss();
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.teal),
                ),
            ),
            child: Padding(
                padding: const EdgeInsets.all(4),
                child: Text('Dismiss',
                        style: TextStyle(
                            color: Colors.white, fontSize: 16),
                        ),
                    ),

        //confirmText: 'Dismiss',
        //confirmPressEvent: () {
        //    dialog.dismiss();
        //},
    );
});
```

Contributions of any kind are welcome.
