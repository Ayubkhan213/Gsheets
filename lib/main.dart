import 'package:flutter/material.dart';
import 'package:g_sheets/global/global_data.dart';
import 'package:g_sheets/routes/app_pages.dart';
import 'package:get/get.dart';

void main() async {
  GSheetServices.init();
  runApp(
    GetMaterialApp(
      title: 'Flutter Gsheet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.yellowAccent.shade100,
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
