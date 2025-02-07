import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/screens/budget_screen.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_tile.dart';
import 'package:gandakimun/widget/heading.dart';
import 'package:gandakimun/widget/pdf_widget.dart';

class BudgetAndPrograms extends StatelessWidget {
  BudgetAndPrograms({Key? key}) : super(key: key);
  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var list = controller.budgetlist;
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(controller.isNepali.value
          ? 'बजेट तथा कार्यक्रमहरु'
          : 'Budget and Programs'),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          buildHeading(controller.isNepali.value
              ? 'बजेट तथा कार्यक्रमहरु'
              : 'Budget and Programs'),
          SizedBox(
            height: size.height * .8,
            width: size.width * .98,
            child: Scrollbar(
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () async {
                        Get.to(() => BudgetScreen(
                              data: list[index],
                            ));
                        // var url = list[index].files.toString();
                        // final file = await PDFApi.loadNetwork(url);
                        // openPdf(file);
                      },
                      child: CustomTile(
                        height: 70,
                        title: controller.isNepali.value
                            ? list[index].title!.np.toString()
                            : list[index].title!.en.toString(),
                        subtitle: list[index].published == null
                            ? ''
                            : list[index].published.toString(),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  openPdf(File file, String url) {
    Get.to(() => PdfWidget(
          file: file,
          url: url,
        ));
  }
}
