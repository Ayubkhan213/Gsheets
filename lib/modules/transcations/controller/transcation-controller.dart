// ignore_for_file: file_names, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:g_sheets/global/global_data.dart';
import 'package:get/get.dart';

class TranscationController extends GetxController {
  RxInt income = 130.obs;
  RxInt balnance = 230.obs;
  RxInt expance = 130.obs;

  var switched = false.obs;

  // Form key
  GlobalKey<FormState> key = GlobalKey();

  //controller decleration
  late TextEditingController amountController, transcationNameController;

  //variable for saving data
  var amount = '';
  var name = '';
  var type = '';

  // Transcation amount Validation
  String? amountvalidation(String value) {
    if (value == '') {
      return 'Please Fill This Field';
    }
    return null;
  }

  // transcation Name Validation
  String? transcationNamevalidation(String value) {
    if (value == '') {
      return 'Please Fill This Field';
    }
    return null;
  }

  void validationData() async {
    final bool isValid = key.currentState!.validate();

    if (!isValid) {
      return;
    }
    key.currentState!.save();
    type == '' ? type = 'expance' : type;
    var success = await GSheetServices.insert(name, amount, type);
    if (success) {
      Get.back();
      Get.snackbar(
        'Success',
        'Successfully Added Datas',
        colorText: Colors.white,
        backgroundColor: Colors.greenAccent,
      );
      amountController.text = '';
      transcationNameController.text = '';
    } else {
      Get.back();
      Get.snackbar(
        'Error',
        'There is Some Error',
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    amountController = TextEditingController();
    transcationNameController = TextEditingController();
  }
}
