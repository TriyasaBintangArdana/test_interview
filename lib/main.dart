import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_interview/providers/auth_provider.dart';
import 'package:test_interview/providers/news_provider.dart';
import 'package:test_interview/screen/home_screen.dart';
import 'package:test_interview/screen/login_view.dart';

void main() {


  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider(),),
        ChangeNotifierProvider(create: (context) => NewsProvider(),),
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, value, child) {
      return MaterialApp(
        title: "Test Intervew",
        home: LoginView() ,
      );
    },);
  }
}