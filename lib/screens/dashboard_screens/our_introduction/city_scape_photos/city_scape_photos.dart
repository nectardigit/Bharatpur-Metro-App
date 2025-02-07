import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/screens/dashboard_screens/our_introduction/city_scape_photos/city_scape_photo_details.dart';
import 'package:gandakimun/screens/dashboard_screens/our_introduction/controller/our_information.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_tile.dart';
import 'package:gandakimun/widget/heading.dart';

class CityScapePhotosPage extends StatelessWidget {
  CityScapePhotosPage({Key? key}) : super(key: key);

  final ourInformationController = Get.put(OurInformationController());
  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var list = controller.cityScapeList;
    return Scaffold(
        backgroundColor: AppColor.backgroundClr,
        appBar: buildAppbar(
          controller.isNepali.value ? 'नगर पार्श्व चित्र' : "Municipal Profile",
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              buildHeading(
                controller.isNepali.value
                    ? 'नगर पार्श्व चित्र'
                    : "CityScape Photos",
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: size.height * .8,
                width: size.width * .98,
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    var data = list[index];
                    return CustomTile(
                      ontap: () {
                        Get.to(CityScapeDetailScreen(
                          cityScapeHeadingModel: data,
                        ));
                      },
                      height: 70,
                      title: controller.isNepali.value
                          ? data.title!.np.toString()
                          : data.title!.en.toString(),
                      subtitle: data.createdAt,
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
