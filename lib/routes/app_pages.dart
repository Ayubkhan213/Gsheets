// ignore_for_file: constant_identifier_names

import 'package:g_sheets/modules/transcations/binding/transcation_binding.dart';
import 'package:g_sheets/modules/transcations/pages/transcation_page.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.TRANSCATION;
  static final routes = [
    GetPage(
      name: _Paths.TRANSCATION,
      page: () => const TranscationPage(),
      binding: TranscationBinding(),
    ),
  ];
}
