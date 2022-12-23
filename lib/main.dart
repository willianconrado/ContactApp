import 'dart:io';
import 'package:app_contact/android/android.app.dart';
import 'package:flutter/material.dart';

void main() {
  if (Platform.isIOS) {
  } else {
    runApp(const ContactApp());
  }
}
