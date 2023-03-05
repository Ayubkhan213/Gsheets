import 'package:g_sheets/modules/transcations/controller/transcation-controller.dart';
import 'package:get/get.dart';

class TranscationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TranscationController>(() => TranscationController());
  }
}
