import 'package:flutter/material.dart';
import 'package:flutter_movil_application/screens/dashboard_screen.dart';
import 'package:flutter_movil_application/screens/login_screen.dart';
import 'package:flutter_movil_application/screens/register_screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/register': (BuildContext context) => const RegisterScreen(),
    '/dash': (BuildContext context) => DashboardScreen(),
    '/login': (BuildContext context) => const LoginScreen()
  };
}
