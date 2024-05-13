import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hinvex_app/features/bottomNavigationBar/presentation/view/bottom_navigation_widget.dart';

import 'authentocation_screen.dart';

class InitializerWidget extends StatefulWidget {
  const InitializerWidget({super.key});

  @override
  State<InitializerWidget> createState() => _InitializerWidgetState();
}

class _InitializerWidgetState extends State<InitializerWidget> {
  FirebaseAuth? auth;

  User? _user;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    auth = FirebaseAuth.instance;
    _user = auth!.currentUser;
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    log("user == " + _user.toString());
    return _isLoading
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : _user == null
            ? AuthenticationScreen()
            : BottomNavigationWidget();
  }
}
