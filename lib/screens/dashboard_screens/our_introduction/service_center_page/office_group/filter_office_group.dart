import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/controllers/introductioncontroller.dart';
import 'package:gandakimun/model/office.dart';
import 'package:gandakimun/model/office_type.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_tile.dart';

class FilterServiceGroup extends StatelessWidget {
  FilterServiceGroup(
      {Key? key, required this.officeTypeHeadingModel, required this.text});
  OfficeTypeHeadingModel officeTypeHeadingModel;
  String text;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppController());
    final introductionController = Get.put(IntroductionController());
    List<OfficeHeadingModel> municipal = introductionController.office
        .where((e) => e.officeType!.en!.contains(text))
        .toList();
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(
        controller.isNepali.value
            ? officeTypeHeadingModel.title!.np.toString()
            : officeTypeHeadingModel.title!.en.toString(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            municipal.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: municipal.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      var data = municipal[index];
                      return CustomTile(
                        title: controller.isNepali.value
                            ? data.title!.np.toString()
                            : data.title!.en.toString(),
                      );
                    })
                : Center(
                    child: Image.asset('assets/nodata.jpg'),
                  )
          ],
        ),
      ),
    );
  }
}
