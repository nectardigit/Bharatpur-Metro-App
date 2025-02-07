import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/elected_officials.dart';
import 'package:gandakimun/model/teams.dart';

class CaoAndSpokePersonScreen extends StatefulWidget {
  const CaoAndSpokePersonScreen({Key? key});

  @override
  State<CaoAndSpokePersonScreen> createState() =>
      _CaoAndSpokePersonScreenState();
}

class _CaoAndSpokePersonScreenState extends State<CaoAndSpokePersonScreen> {
  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    List<ElectedOfficalsData> spokePerson =
        controller.electedOffical.where((e) => e.isSpokeperson == '1').toList();
    print("lenghth$spokePerson");
    List<TeamData> isCao =
        controller.teamlist.where((e) => e.isCao == 1).toList();
    print("lenghth$isCao");
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 05.0),
            child: Row(
              children: [
                SizedBox(
                  height: 230,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: isCao.length,
                      itemBuilder: (context, index) {
                        var data = isCao[index];
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: Image.network(
                                    data.profile!,
                                    height: 140,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  controller.isNepali.value
                                      ? Text(
                                          ' ${data.name!.np.toString()}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      : Text(
                                          ' ${data.name!.en.toString()}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                  controller.isNepali.value
                                      ? Text(data.designation!.np.toString())
                                      : Text(data.designation!.en.toString()),
                                  Text(data.phone!.toString()),
                                  Text(data.email!.toString()),
                                ],
                              ),
                            ),
                          ],
                        );
                      }),
                ),
                // SizedBox(
                //   height: 200,
                //   child: ListView.builder(
                //       shrinkWrap: true,
                //       scrollDirection: Axis.horizontal,
                //       itemCount: spokePerson.length,
                //       itemBuilder: (context, index) {
                //         var data = spokePerson[index];
                //         return Column(
                //           mainAxisSize: MainAxisSize.min,
                //           children: [
                //             const SizedBox(
                //               height: 10,
                //             ),
                //             Align(
                //               alignment: Alignment.center,
                //               child: Center(
                //                 child: CircleAvatar(
                //                   radius: 40,
                //                   backgroundImage:
                //                   NetworkImage(data.image.toString()),
                //                 ),
                //               ),
                //             ),
                //             const SizedBox(
                //               height: 10,
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.only(left: 8.0),
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.center,
                //                 children: [
                //                   controller.isNepali.value
                //                       ? Text('${data.name!.np.toString()}')
                //                       : Text(' ${data.name!.en.toString()}'),
                //                   controller.isNepali.value
                //                       ? Text(
                //                       '${data.spokepersonDesignation!.np
                //                           .toString()}')
                //                       : Text(
                //                       '${data.spokepersonDesignation!.en
                //                           .toString()}'),
                //                   Text(' ${data.phone ?? ""}'),
                //                   Text(' ${data.email ?? ""}'),
                //                 ],
                //               ),
                //             ),
                //           ],
                //         );
                //       }),
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
