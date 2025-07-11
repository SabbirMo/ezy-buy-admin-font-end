import 'package:flutter/material.dart';

import 'package:toastification/toastification.dart';

class CustomToast {
  static successToast({String? title, required String message, Color? color, Duration? duration}) {


    toastification.show(
      title: Text(title ?? "Success"),
      style: ToastificationStyle.flatColored,
      description: Text(message),
      type: ToastificationType.success,
      autoCloseDuration: const Duration(seconds: 3),
    );
  }

  static errorToast({String? title, required String message, Color? color, Duration? duration}) {
    toastification.show(
      title: Text(title ?? "Error"),
      description: Text(message),
      type: ToastificationType.error,
      style: ToastificationStyle.flatColored,
      autoCloseDuration: const Duration(seconds: 3),
    );
  }
}
