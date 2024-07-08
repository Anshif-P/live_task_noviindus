import 'package:flutter/material.dart';
import 'package:noviindus_live_task_/src/features/authentication/controller/register_provider.dart';
import 'package:noviindus_live_task_/src/features/authentication/view/screen_register.dart';
import 'package:noviindus_live_task_/src/features/show_video/controller/get_home_datas.dart';
import 'package:noviindus_live_task_/src/features/show_video/view/screen_home.dart';
import 'package:noviindus_live_task_/src/resources/local/shared_pref_model.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefModel.instance.initSharedPref();

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
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ScreenHome(),
      ),
    );
  }
}
