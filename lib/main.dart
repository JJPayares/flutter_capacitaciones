import 'package:flutter/material.dart';
import 'package:flutter_capacitaciones/modules/user_profile/ui/pages/user_profile.dart';
import 'package:flutter_capacitaciones/ui/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const UserProfile(),
      onGenerateRoute: (settings) {
        return CustomRoutes.routes(settings);
      },
    );
  }
}
