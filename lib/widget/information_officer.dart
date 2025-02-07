import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/suchana_adhikari.dart';
import 'package:gandakimun/widget/nodata.dart';
import 'package:get/get.dart';

class InformationOfficerScreen extends StatefulWidget {
  InformationOfficerScreen({Key? key}) : super(key: key);

  @override
  State<InformationOfficerScreen> createState() =>
      _InformationOfficerScreenState();
}

class _InformationOfficerScreenState extends State<InformationOfficerScreen> {
  final controller = Get.put(AppController());

  @override
  void initState() {
    controller.fetchOfficeContact();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<SuchanaAdhikariData> suchanaAdhikariData =
        controller.informationOfficer.where((e) => e.id != null).toList();

    return Obx(
      () => SizedBox(
        height: 230,
        child: controller.informationOfficer.isNotEmpty
            ? ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: suchanaAdhikariData.length,
                itemBuilder: (context, index) {
                  var data = suchanaAdhikariData[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Center(
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: data.profile != null &&
                                      data.profile!.isNotEmpty
                                  ? DecorationImage(
                                      fit: BoxFit.fill,
                                      image: CachedNetworkImageProvider(
                                          data.profile!),
                                    )
                                  : const DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          'assets/images/default_profile.png'),
                                    ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                controller.isNepali.isTrue
                                    ? data.name?.np ?? 'N/A'
                                    : data.name?.en ?? 'N/A',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                controller.isNepali.isTrue
                                    ? data.designation?.np ?? 'N/A'
                                    : data.designation?.en ?? 'N/A',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300),
                              ),
                              Text(
                                data.phone ?? '',
                                style: const TextStyle(color: Colors.black),
                              ),
                              Text(
                                data.email ?? '',
                                style: const TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  );
                },
              )
            : buildNodata(),
      ),
    );
  }
}
