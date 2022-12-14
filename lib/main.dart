import 'package:blow_shot/app/auth_gate/auth_gate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          builder: (BuildContext context, child) => const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BlowShot',
      theme: ThemeData(
          primaryColor: Colors.yellowAccent, fontFamily: "YujiBoku-Regular"),
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
    );
  }
}
