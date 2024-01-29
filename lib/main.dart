import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:test_error/db/db_helper.dart';
import 'package:test_error/pages/create/bindings.dart';
import 'package:test_error/pages/create/create.dart';
import 'package:test_error/pages/home/bindings.dart';
import 'package:test_error/pages/home/home.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.initDb();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => const HomePage(), binding: HomeBindings()),
        GetPage(name: "/create", page: () => const CreatePage(), binding: CreateBindings())
      ],
    );
  }
}
