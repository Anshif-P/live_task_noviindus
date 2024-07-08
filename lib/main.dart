import 'package:flutter/material.dart';
import 'package:noviindus_live_task_/src/features/authentication/controller/register_provider.dart';
import 'package:noviindus_live_task_/src/features/authentication/view/screen_register.dart';
import 'package:noviindus_live_task_/src/features/show_video/view/screen_home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RegisterProvider(),
        )
      ],
      child: MaterialApp(
        home: ScreenRegister(),
      ),
    );
  }
}
