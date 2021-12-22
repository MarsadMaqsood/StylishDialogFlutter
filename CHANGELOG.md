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