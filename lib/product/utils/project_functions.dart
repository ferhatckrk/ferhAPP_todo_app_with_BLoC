import 'package:flutter/material.dart';

Widget addSpaceVertical(double value) {
  return SizedBox(
    height: value,
  );
}

Widget addSpaceHorizontal(double value) {
  return SizedBox(
    width: value,
  );
}

/// close if open keyboard
void closeFocus() {
  FocusManager.instance.primaryFocus?.unfocus();
}
