import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../constants.dart';
import '../../../../model/elected_officials.dart';
import '../../../../model/teams.dart';
import '../../../../widget/appbar.dart';
import '../../../../widget/box_shadow.dart';
import '../../../../widget/nodata.dart';

class WardMembersDetails extends StatefulWidget {
  WardMembersDetails({Key? key, this.wardId, this.wardEnglish, this.wardNepali})
      : super(key: key);

  String? wardId;
  String? wardEnglish;
  String? wardNepali;

  @override
  State<WardMembersDetails> createState() => _WardMembersDetailsState();
}

class _WardMembersDetailsState extends State<WardMembersDetails> {
  var controller = Get.put(AppController());

  ElectedOfficalsData? executive;
  List<ElectedOfficalsData>? electedOfficials;
  List<TeamData>? teams = [];

  List<ElectedOfficalsData> executives = [];
  List<ElectedOfficalsData> councilMembers = [];

  @override
  void initState() {
    super.initState();

    electedOfficials = controller.electedOffical
        .where((electedOfficial) =>
            electedOfficial.wardNumber?.en == widget.wardEnglish.toString())
        .toList();

    teams = controller.teamlist
        .where((team) =>
            team.office?.np ==
            widget.wardNepali!.split(" ").last + " नं वडा कार्यालय")
        .toList();

    executives = electedOfficials!
        .where((official) => official.executiveDesignation?.np != null)
        .toList();
    councilMembers = electedOfficials!
        .where((official) => official.isCouncil == "1")
        .where((element) => element.executiveDesignation?.np != "वडाध्यक्ष")
        .toList();
    //
    // log(widget.wardNepali!.split(" ").last + " नं वडा कार्यालय");
    // log(teams!.length.toString());
    // log(controller.teamlist!.length.toString());
  }

  @override
  Widget build(BuildContext context) {
    List<ElectedOfficalsData> wardfficers = controller.electedOffical
        .where((e) => e.wardNumber!.en == widget.wardEnglish)
        .toList();
    // var electedOfficials = []
    return Obx(() => Scaffold(
          appBar: buildAppbar(
            controller.isNepali.value == true
                ? widget.wardNepali.toString()
                : widget.wardEnglish.toString(),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(

                    controller.isNepali.value == true
                        ? "जनप्रतिनिधि"
                        : "Peoples representatives",
                    style: TextStyle(fontSize: 18.sp, color: Colors.black),
                  ),
                  SizedBox(
                      height: 250,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: wardfficers.length,
                        itemBuilder: (context, index) {
                          var data = wardfficers[index];
                          return data.id != null
                              ? buildOfficialsCard(
                                  data.image,
                                  controller.isNepali.value
                                      ? data.name!.np
                                      : data.name!.en,
                                  '\n${data.wardDesignation!.np != null ? controller.isNepali.value ? data.wardDesignation!.np : data.wardDesignation!.en : ""}\n${data.email != null ? data.email : ""}\n${data.phone}')
                              : buildNodata();
                        },
                      )),
                  // Divider(),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.all(10),
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Center(
                  //         child: Container(
                  //           height: 50.sp,
                  //           width: 50.sp,
                  //           decoration: BoxDecoration(
                  //               color: Color(0xfff2f2f2),
                  //               borderRadius: BorderRadius.circular(20)),
                  //           child: CachedNetworkImage(
                  //             imageUrl: executives.length == 0
                  //                 ? ""
                  //                 : executives[0].image.toString(),
                  //             // executives == null
                  //             //     ? ""
                  //             //     : executives[0].image.toString(),
                  //             placeholder: (context, url) => const Center(
                  //                 child: SizedBox(
                  //                     height: 20,
                  //                     width: 20,
                  //                     child: CircularProgressIndicator())),
                  //             errorWidget: (context, url, error) =>
                  //                 const Icon(Icons.error),
                  //             fit: BoxFit.cover,
                  //           ),
                  //         ),
                  //       ),
                  //       SizedBox(
                  //         height: 20,
                  //       ),
                  //       SizedBox(
                  //         height: 40.sp,
                  //         child: ListView.separated(
                  //             scrollDirection: Axis.horizontal,
                  //             itemBuilder: (context, index) {
                  //               return Container(
                  //                 width: 40.sp,
                  //                 decoration: BoxDecoration(
                  //                     color: Color(0xfff2f2f2),
                  //                     borderRadius: BorderRadius.circular(20)),
                  //                 child: CachedNetworkImage(
                  //                   imageUrl:
                  //                       councilMembers[index].image.toString(),
                  //                   placeholder: (context, url) => const Center(
                  //                       child: SizedBox(
                  //                           height: 20,
                  //                           width: 20,
                  //                           child:
                  //                               CircularProgressIndicator())),
                  //                   errorWidget: (context, url, error) =>
                  //                       const Icon(Icons.error),
                  //                   fit: BoxFit.cover,
                  //                 ),
                  //               );
                  //             },
                  //             separatorBuilder: (context, index) {
                  //               return SizedBox(
                  //                 width: 20,
                  //               );
                  //             },
                  //             itemCount: councilMembers.length),
                  //       ),
                  //       Divider(),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  teams!.isEmpty
                      ? SizedBox()
                      : Text(
                          controller.isNepali.value == true
                              ? "कर्मचारीहरु"
                              : "Staffs",
                          style: TextStyle(fontSize: 18.sp, color: Colors.blue),
                        ),
                  SizedBox(
                    height: 20,
                  ),
                  teams!.length == 0
                      ? SizedBox()
                      : SizedBox(
                          height: (teams!.length.toDouble() * 80.sp),
                          child: ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return Card(
                                  shadowColor: Colors.blue,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 40.sp,
                                          height: 40.sp,
                                          decoration: BoxDecoration(
                                              color: Color(0xfff2f2f2),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: CachedNetworkImage(
                                            // imageUrl: teams![index].profile.toString(),
                                            imageUrl: teams![index]
                                                .profile
                                                .toString(),
                                            placeholder: (context, url) =>
                                                const Center(
                                                    child: SizedBox(
                                                        height: 20,
                                                        width: 20,
                                                        child:
                                                            CircularProgressIndicator())),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                controller.isNepali.value ==
                                                        true
                                                    ? teams![index]
                                                        .name!
                                                        .np!
                                                        .toString()
                                                    : teams![index]
                                                        .name!
                                                        .en!
                                                        .toString(),
                                                style: TextStyle(
                                                    fontSize: 18.sp,
                                                    color: Colors.red),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(controller.isNepali.value ==
                                                      true
                                                  ? teams![index]
                                                      .designation!
                                                      .np!
                                                      .toString()
                                                  : teams![index]
                                                      .designation!
                                                      .en!
                                                      .toString()),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(controller.isNepali.value ==
                                                      true
                                                  ? teams![index]
                                                      .address!
                                                      .toString()
                                                  : teams![index]
                                                      .address
                                                      .toString()),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Email: " +
                                                    teams![index]
                                                        .email!
                                                        .toString(),
                                                style: TextStyle(
                                                    color: Colors.green),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text("Phone: " +
                                                  teams![index]
                                                      .phone!
                                                      .toString()),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(controller.isNepali.value ==
                                                      true
                                                  ? teams![index]
                                                      .branch!
                                                      .np!
                                                      .toString()
                                                  : teams![index]
                                                      .branch!
                                                      .np!
                                                      .toString()),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  width: 20,
                                );
                              },
                              itemCount: teams!.length),
                        ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    controller.isNepali.value == true
                        ? "अन्य विवरणहरु "
                        : "Other Descriptions",
                    style: TextStyle(fontSize: 18.sp, color: Colors.blue),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  buildOfficialsCard(img, String? name, String? text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        width: 200,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color.fromARGB(255, 250, 250, 250),
            boxShadow: [buildBoxShadow()]),
        child: ListTile(
            // minVerticalPadding: 10,
            title: SizedBox(
              height: 120,
              child: CachedNetworkImage(
                imageUrl: img,
                placeholder: (context, url) => const SizedBox(
                    height: 100,
                    // width: 50,
                    child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.contain,
              ),
            ),
            subtitle: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(text: name, style: subtitleStyle.copyWith()),
                  TextSpan(
                    text: text,
                    style: subtitleStyle,
                  )
                ]))),
      ),
    );
  }
}
