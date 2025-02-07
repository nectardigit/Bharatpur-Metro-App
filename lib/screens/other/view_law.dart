// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../constants.dart';
// import '../../controllers/appcontroller.dart';
// import '../../widget/appbar.dart';
// import '../../widget/box_shadow.dart';
// import '../../widget/nodata.dart';

// class ViewLaw extends StatelessWidget {

//   ViewLaw({Key? key,this.title}) : super(key: key);

//   final String? title;

//   final controller = Get.put(AppController());


//   @override
//   Widget build(BuildContext context) {
//      return Scaffold(
//          backgroundColor: AppColor.backgroundClr,
//          appBar: buildAppbar(title),
//          body: SingleChildScrollView(
//            child: Obx(() => controller.lawlist.isNotEmpty?
//            Column(
//              children: [
//                ...List.generate(controller.lawlist.length, (index) {
//                  var data = controller.lawlist[index];
//                  return GestureDetector(
//                    // onTap: (() => Get.to(() => KarmachriDetails(
//                    //   data: data,
//                    // ))),
//                    child: Padding(
//                      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
//                      child: Container(
//                        width: double.infinity,
//                        padding: const EdgeInsets.all(15),
//                        decoration: BoxDecoration(
//                            color: Colors.white,
//                            borderRadius: BorderRadius.circular(8),
//                            boxShadow: [buildBoxShadow()]),
//                           child: Column(
//                              crossAxisAlignment:
//                              CrossAxisAlignment.start,
//                              children: [
//                               //  Text(
//                               //    controller.isNepali.value?
//                               //    data.heading!.np.toString():
//                               //    data.heading!.en.toString(),
//                               //    style: titleStyle.copyWith(
//                               //        color: AppColor.primaryClr,
//                               //        fontSize: 16,
//                               //        fontWeight: FontWeight.w400),
//                               //  ),
//                                const SizedBox(height: 10,),
//                                Text(
//                                  controller.isNepali.value?
//                                  data.lawType!.np.toString():
//                                  data.lawType!.en.toString(),
//                                  style: titleStyle.copyWith(
//                                      color: AppColor.primaryClr,
//                                      fontSize: 16,
//                                      fontWeight: FontWeight.w400),
//                                ),

//                                const SizedBox(
//                                  height: 10,
//                                ),
//                               //  Text(
//                               //      controller.isNepali.value?
//                               //      data.lawName!.np.toString():
//                               //      data.lawName!.en.toString(),

//                               //      style: subtitleStyle),
//                                const SizedBox(height: 10,),
//                                Text(
//                                    controller.isNepali.value?
//                                    data.lawLevel!.np.toString():
//                                    data.lawLevel!.en.toString(),

//                                    style: subtitleStyle),
//                                const SizedBox(height: 10,),
//                               //  Text(
//                               //     data.slug.toString(),
//                               //      style: subtitleStyle),
//                              ],
//                            ),
//                      ),
//                    ),
//                  );
//                })
//              ],
//            ):buildNodata(),
//            ),
//          )
//      );
//   }
// }

