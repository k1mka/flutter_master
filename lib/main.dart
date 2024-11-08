import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_master/firebase_options.dart';
import 'package:flutter_master/flutter_master.dart';
import 'package:flutter_master/setup_service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  serviceLocator();
  runApp(const FlutterMaster());
}
