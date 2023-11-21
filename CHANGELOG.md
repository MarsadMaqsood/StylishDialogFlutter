## 1.1.0-beta
- Removed deprecated APIs
- Fixed bugs


## 1.0.2
Changes: 
- `Style.Default` to `DefaultStyle()`
- `Style.Style1` to `Style1()`

Fix: bug

## 1.0.1
Fix: bug

## 1.0.1-beta
Fix: bug

## 1.0.0
```diff
+ title:
+ content:

- titleText:
- contentText:
- titleStyle:
- contentStyle:
```
- Fix: bug
- Updated documentation

## 0.1.3
- Removed unnecessary code
- Fix: lint warnings

## 0.1.2
- Fix: bug

## 0.1.1
- Added `showAdaptiveDialog`

## 0.0.13
- Fix: Text color

## 0.0.12
- Updated Changelog and example code

## 0.0.11
- Added controller to handle dialog listeners

## 0.0.10
- Added dialog styles
```diff
+ Style.Default
+ Style.Style1
```
- Improved addView: usage

## 0.0.9
- Revert some changes
- Added
```diff
+ titleStyle:
+ contentStyle:
+ progressColor:
```

## 0.0.8+1
- Fixed some bugs

## 0.0.8

 - ✔️ Added
```diff
+ confirmButton:
+ cancelButton:
```

 - ❌ Deprecated
```dart
@deprecated confirmText:
@deprecated cancelText:
@deprecated confirmPressEvent:
@deprecated cancelPressEvent:
```

## 0.0.7
- Added `animationLoop:` to play animations in a loop
```diff
+ animationLoop:
```
- Performance Improvement
- Bug Fixes

## 0.0.6
Added `addView:` to add custom widget inside dialog.
```diff

+ addView:

```

## 0.0.5+1

```diff

+ rootNavigator:

```


## 0.0.5

Added `changeAlertType()` function to change current dialog type.
```diff
+ changeAlertType()

```

## 0.0.4+1

```diff
+ dismissOnTouchOutside:
+ .show()
+ .dismiss()

```


## 0.0.4

### Added
```diff
+ confirmText:
+ cancelText:
+ confirmPressEvent:
+ cancelPressEvent:
```


## 0.0.3+1

* Fixed content text alignment

## 0.0.3

* Initial release