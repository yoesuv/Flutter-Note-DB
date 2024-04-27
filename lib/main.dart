import 'package:flutter/material.dart';
import 'package:flutter_note/src/core/db/app_objectbox.dart';
import 'package:flutter_note/src/my_app.dart';

late AppObjectBox appObjectBox;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  appObjectBox = await AppObjectBox.create();
  runApp(const MyApp());
}