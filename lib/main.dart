import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_flutter_gluon/constant/text_constant.dart';
import 'package:test_flutter_gluon/router/route.dart';
import 'package:test_flutter_gluon/screen/choose_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: TextConstant().appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
    );
  }
}
