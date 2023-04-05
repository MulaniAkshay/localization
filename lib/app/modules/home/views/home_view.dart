import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/home_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.localization),
        actions: [
          Obx(
            () => Center(
              child: DropdownButton(
                value: controller.dropvalues,
                icon: const Icon(
                  Icons.language,
                  color: Colors.black,
                ),
                elevation: 0,
                items: controller.lung.map(
                  (e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text("$e"),
                    );
                  },
                ).toList(),
                onChanged: (value) {
                  controller.dropvalues = value!;
                  controller.localization(context);
                },
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context)!.localizationDemo),
            const SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.none,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: AppLocalizations.of(context)!.name,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.none,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: AppLocalizations.of(context)!.email,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.none,
              autovalidateMode: AutovalidateMode.always,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: AppLocalizations.of(context)!.selectDate,
                suffixIcon: const Icon(
                  Icons.date_range,
                ),
              ),
              controller: controller.dateinput1,
              onTap: () async {
                DateTime? date = DateTime.now();
                DateTime? pickedDate1 = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(date.year, date.month, date.day + 5),
                );

                if (pickedDate1 != null) {
                  debugPrint("$pickedDate1");
                  String formattedDate1 =
                      DateFormat('dd-MM-yyyy').format(pickedDate1);
                  debugPrint(formattedDate1);

                  controller.dateinput1.text = formattedDate1;
                  debugPrint(controller.dateinput1.text);
                } else {
                  debugPrint("Date is not selected");
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(AppLocalizations.of(context)!.submit),
            ),
          ],
        ),
      ),
    );
  }
}
