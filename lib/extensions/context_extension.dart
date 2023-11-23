import 'package:flutter/material.dart';

extension BuildContextTextTheme on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension BuildContextColor on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  Color get primaryColor => colorScheme.primary;
  Color get onPrimaryColor => colorScheme.onPrimary;
  Color get primaryContainerColor => colorScheme.primaryContainer;
  Color get onPrimaryContainerColor => colorScheme.onPrimaryContainer;
  Color get inversePrimaryColor => colorScheme.inversePrimary;

  Color get errorColor => colorScheme.error;
  Color get onErrorColor => colorScheme.onError;
  Color get errorContainerColor => colorScheme.errorContainer;
  Color get onErrorContainerColor => colorScheme.onErrorContainer;

  Color get secondaryColor => colorScheme.secondary;
  Color get onSecondaryColor => colorScheme.onSecondary;
  Color get secondaryContainerColor => colorScheme.secondaryContainer;
  Color get onSecondaryContainer => colorScheme.onSecondaryContainer;

  Color get disabledColor => Theme.of(this).disabledColor;
}
