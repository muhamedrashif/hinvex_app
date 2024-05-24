// import 'dart:developer';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:hinvex_app/features/bottomNavigationBar/presentation/view/bottom_navigation_widget.dart';
// import 'package:hinvex_app/features/location/presentation/provider/location_provider.dart';
// import 'package:hinvex_app/features/onboard/presentation/view/onboard_screen_.dart';
// import 'package:provider/provider.dart';

// class InitializerWidget extends StatefulWidget {
//   const InitializerWidget({super.key});

//   @override
//   State<InitializerWidget> createState() => _InitializerWidgetState();
// }

// class _InitializerWidgetState extends State<InitializerWidget> {
//   FirebaseAuth? auth;

//   User? _user;

//   bool _isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     auth = FirebaseAuth.instance;
//     _user = auth!.currentUser;
//     _isLoading = false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     log("user == $_user");
//     return _isLoading
//         ? const Scaffold(
//             body: Center(
//               child: CircularProgressIndicator(),
//             ),
//           )
//         : _user == null && context.read<LocationProvider>().currentPlace == null
//             ? const OnBoardScreen()
//             : const BottomNavigationWidget();
//   }
// }
