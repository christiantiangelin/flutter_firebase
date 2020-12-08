import 'package:firebase_app/screen/HomePage.dart';
import 'package:firebase_app/screen/login.dart';
import 'package:firebase_app/screen/register.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/home':
      return MaterialPageRoute(builder: (_) => HomePage());
    case '/login':
      return MaterialPageRoute(builder: (_) => Login());
    case '/daftar':
      return MaterialPageRoute(builder: (_) => DaftarPage());
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
                child: Text('Halaman ${settings.name} tidak temukan')),
          ));
  }
}