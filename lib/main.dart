import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet/app/providers/auth_provider.dart';
import 'package:wallet/app/providers/bottom_navigation_provider.dart';
import 'package:wallet/app/providers/messages_provider.dart';
import 'package:wallet/app/utils/shared_preffs.dart';

import 'app/view/home/page/home_page.dart';
import 'app/view/login/page/login_page.dart';
import 'routing/route_generator.dart';

// ignore: avoid_void_async
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp()
      .then((FirebaseApp value) => print('Firebase Initialize'));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    _initializeApp();
    super.initState();
  }

  String email = '';

  Future<void> _initializeApp() async {
    email = await SharedPreffs().readEmailFromShared();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // ignore: always_specify_types
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (BuildContext context) => AuthProvider(),
        ),
        ChangeNotifierProvider<BottomNavigationProvider>(
          create: (BuildContext context) => BottomNavigationProvider(),
        ),
        ChangeNotifierProvider<MessagesProvider>(
          create: (BuildContext context) => MessagesProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.generateRoute,
        title: 'Chat',
        home: email.isEmpty ? LoginPage() : HomePage(),
      ),
    );
  }
}
