import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../main.dart';

class HomeController extends GetxController {
  List lung = [
    "English",
    "Gujrati",
    "Hindi",
  ];
    TextEditingController dateinput1 = TextEditingController();

  final _dropvalues = 'English'.obs;
  get dropvalues => _dropvalues.value;
  set dropvalues(value) => _dropvalues.value = value;

  void localization(BuildContext context) async {
    Get.dialog(const Center(
      child: CircularProgressIndicator(),
    ));
    switch (dropvalues) {
      case "English":
        MyApp.setLocal(context, const Locale('en', ''));
        break;
      case "Gujrati":
        MyApp.setLocal(context, const Locale('gu', ''));
        break;
      case "Hindi":
        MyApp.setLocal(context, const Locale('hi', ''));
        break;
      default:
    }
    await Future.delayed(const Duration(seconds: 1));
    Get.back();
  }
}
