import 'package:flutter/material.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/gazette_model.dart';
import 'package:gandakimun/screens/dashboard_screens/notice_and_information/views/gazette/gazette_details.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_tile.dart';
import 'package:get/get.dart';

import '../../../../../../widget/heading.dart';

class GezetteTitleScreen extends StatelessWidget {
  GezetteTitleScreen({
    Key? key,
    required this.text,
    this.gazetteHeadingModel,
  }) : super(key: key);
  final String text;
  final GazetteHeadingModel? gazetteHeadingModel;
  final controller = Get.put(AppController());

  initState() {
    controller.fetchGezette();
  }

  @override
  Widget build(BuildContext context) {
    controller.fetchGezette();
    print(text);
    var list = controller.gazetteList;
    List<GazetteHeadingModel> filter =
        list.where((e) => e.sectionGazette == text.toString()).toList();
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(text),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            buildHeading(text),
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: filter.length,
              itemBuilder: (context, index) {
                var data = filter[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () async {
                      Get.to(GazetteDetailsScreen(
                        data: data,
                      ));
                    },
                    child: CustomTile(
                      height: 70,
                      title: controller.isNepali.value
                          ? data.title!.np.toString()
                          : data.title!.en.toString(),
                      trailing: const Icon(Icons.arrow_right_alt),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
