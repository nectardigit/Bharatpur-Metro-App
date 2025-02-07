import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/animal_service.dart';
import 'package:gandakimun/model/public_service.dart';
import 'package:gandakimun/screens/dashboard_screens/public_services_page/widget/service_category_fileOpen.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/box_shadow.dart';
import 'package:gandakimun/widget/custom_tile.dart';
import 'package:gandakimun/widget/nodata.dart';

class AnimalServiceScreen extends StatelessWidget {
  AnimalServiceScreen({Key? key}) : super(key: key);

  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    List<PublicSericeHeadingModel> animalService = controller.publicService
        .where((e) => e.serviceCategoryId! == 4)
        .toList();
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(
          controller.isNepali.isTrue ? 'पशु सेवा' : 'Animal Service'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Obx(() => controller.animalServicelist.isNotEmpty
              ? Column(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: animalService.length,
                        itemBuilder: (context, index) {
                          var data = animalService[index];
                          return CustomTile(
                            ontap: () {
                              Get.to(PublicServiceFileOpen(
                                publicSericeHeadingModel: data,
                                text: controller.isNepali.isTrue
                                    ? 'पशु सेवा'
                                    : 'Animal Service',
                              ));
                            },
                            height: 70,
                            title: controller.isNepali.value
                                ? data.title!.np.toString()
                                : data.title!.en.toString(),
                            subtitle: data.createdAt,
                            trailing: const Icon(Icons.picture_as_pdf),
                          );
                        }),
                  ],
                )
              : buildNodata()),
        ),
      ),
    );
  }
}

class AnimalServiceDetails extends StatelessWidget {
  const AnimalServiceDetails({Key? key, required this.data}) : super(key: key);
  final AnimalServiceData data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar('Animal Service details'),
      backgroundColor: AppColor.backgroundClr,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.heading!.en.toString(),
                style: titleStyle,
              ),
              Container(
                height: 3,
                width: 50,
                color: AppColor.red,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white, boxShadow: [buildBoxShadow()]),
                child: ListTile(
                  title: Text(
                    data.title!.en.toString(),
                  ),
                  subtitle: Column(
                    children: [
                      Html(data: data.details!.en.toString()),
                      CachedNetworkImage(
                        imageUrl: data.document.toString(),
                        placeholder: (context, url) => const Center(
                            child: SizedBox(
                                height: 50,
                                width: 50,
                                child: CircularProgressIndicator())),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        fit: BoxFit.cover,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
