import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:travel_companion/firebase_options.dart';
import 'package:travel_companion/screens/loading_screen.dart';
import 'package:travel_companion/screens/mainpage.dart';
import 'package:get/get.dart';
import 'package:travel_companion/services/auth_services.dart';
import 'package:travel_companion/services/data_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(AuthService());
  Get.put(DataService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
      home: Loading(),
    );
  }
}
