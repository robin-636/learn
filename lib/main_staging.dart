import 'package:flutter/material.dart';
import 'config/app_config.dart';
import 'main.dart';

void main() {
  AppConfig.initialize(Environment.staging);
  runApp(const MyApp());
}
