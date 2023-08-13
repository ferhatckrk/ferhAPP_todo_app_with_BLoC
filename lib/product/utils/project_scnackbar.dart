import 'package:flutter/material.dart';
import 'package:my_todo_app_with_bloc/product/enum/enum.dart';

void showSnackBar(
    {required BuildContext context,
    required String message,
    SnackBarAction? action,
    EnumSnackBarType? type = EnumSnackBarType.message}) {
  ScaffoldMessenger.of(context).showSnackBar(_snackBar(message, action, type));
}

SnackBar _snackBar(
    String message, SnackBarAction? action, EnumSnackBarType? type) {
  switch (type) {
    case EnumSnackBarType.message:
      return SnackBar(
          action: action,
          content: Text(
            message,
          ));
    case EnumSnackBarType.success:
      return SnackBar(
          backgroundColor: Colors.green,
          action: action,
          content: Text(
            message,
          ));
    case EnumSnackBarType.error:
      return SnackBar(
          backgroundColor: Colors.red,
          action: action,
          content: Text(
            message,
          ));

    default:
      return SnackBar(
          backgroundColor: Colors.green,
          action: action,
          content: Text(
            message,
          ));
  }
}
