// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:g_sheets/global/global_data.dart';
import 'package:g_sheets/modules/transcations/controller/transcation-controller.dart';
import 'package:get/get.dart';

import '../../../common/transcation_reusable_widget.dart';

class TranscationPage extends GetView<TranscationController> {
  const TranscationPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            ph(15.0),
            //Transcation Box
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                height: height * 0.25,
                decoration: BoxDecoration(
                  boxShadow: [
                    const BoxShadow(
                      offset: Offset(-6, -6),
                      spreadRadius: 1,
                      blurRadius: 14,
                      color: Colors.white,
                    ),
                    BoxShadow(
                      offset: const Offset(6, 6),
                      spreadRadius: 1,
                      blurRadius: 14,
                      color: Colors.grey.shade600,
                    ),
                  ],
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        text(
                          txt: 'B A L A N C E',
                          color: Colors.grey.shade500,
                        ),
                      ],
                    ),
                    ph(20.0),
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          text(
                            txt: '\$' '${GSheetServices.balance.value}',
                            size: 30.0,
                            color: Colors.grey.shade600,
                          ),
                        ],
                      ),
                    ),
                    ph(17.0),
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            inconEcpanceRecord(
                              title: 'Income',
                              iconColor: Colors.greenAccent,
                              arrow: Icons.arrow_upward,
                              amount: GSheetServices.totalexpance.value,
                            ),
                            inconEcpanceRecord(
                              title: 'Expance',
                              iconColor: Colors.redAccent,
                              arrow: Icons.arrow_downward,
                              amount: GSheetServices.totalincome.value,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Transcation Body
            Obx(
              () => Expanded(
                  child: GSheetServices.transcationData.isEmpty
                      ? const Center(
                          child: Image(
                            image: AssetImage('assets/images/empty.png'),
                          ),
                        )
                      : ListView.builder(
                          itemCount: GSheetServices.transcationData.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: transcations(
                                expanceorincom: GSheetServices
                                    .transcationData[index].transcationType,
                                money: GSheetServices
                                    .transcationData[index].transcationAmount,
                                transcationName: GSheetServices
                                    .transcationData[index].transcationName,
                              ),
                            );
                          })),
            ),
            //Footer
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Get.dialog(
                    AlertDialog(
                      title: Form(
                        key: controller.key,
                        child: Column(
                          children: [
                            text(
                              txt: 'N E W  T R A N S C A T I O N',
                              size: 15.0,
                              color: Colors.grey.shade800,
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    text(
                                      txt: 'Expances',
                                      size: 16.0,
                                    ),
                                    pw(5.0),
                                    Obx(
                                      () => Switch(
                                          value: controller.switched.value,
                                          onChanged: (value) {
                                            controller.switched.value = value;
                                            print(value);
                                            value
                                                ? controller.type = 'income'
                                                : controller.type = 'expance';
                                          }),
                                    ),
                                    pw(5.0),
                                    text(txt: 'Income', size: 16.0),
                                    ph(5.0),
                                  ],
                                ),
                              ],
                            ),
                            inputField(
                              hintText: 'amount',
                              controller: controller.amountController,
                              validation: (value) {
                                return controller.amountvalidation(value);
                              },
                              save: (value) {
                                controller.amount = value;
                              },
                            ),
                            inputField(
                              hintText: 'For What',
                              controller: controller.transcationNameController,
                              validation: (value) {
                                return controller
                                    .transcationNamevalidation(value);
                              },
                              save: (value) {
                                controller.name = value;
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ActionChip(
                                    backgroundColor: Colors.grey.shade800,
                                    onPressed: () {
                                      Get.back();
                                    },
                                    label: text(
                                      txt: 'Cancle',
                                      color: Colors.white,
                                    )),
                                pw(5.0),
                                ActionChip(
                                  onPressed: () {
                                    controller.validationData();
                                  },
                                  backgroundColor: Colors.grey.shade800,
                                  label: text(
                                    txt: 'Enter',
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  height: height * 0.09,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.grey[400],
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
