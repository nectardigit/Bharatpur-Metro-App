import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/screens/other/ghatana_report.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_button.dart';
import 'package:gandakimun/widget/not_uploaded.dart';

class Suryodaya extends StatelessWidget {
  Suryodaya({Key? key}) : super(key: key);
  final controller = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(controller.isNepali.value
          ? 'इ.प्र.का. सूर्योदय'
          : "E.Pra.Ka. Gandaki"),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                buildGrid(),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'नयाँ सुचनहरु',
                  style: subtitleStyle.copyWith(
                      fontSize: 20, color: AppColor.primaryClr),
                ),
                customButton('सबै सुचनहरु हेर्नुहोस्', () {}),
                Text(
                  'कार्यालयको विवरणहरु',
                  style: subtitleStyle.copyWith(
                      fontSize: 20, color: AppColor.primaryClr),
                ),
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primaryClr,
        child: const Icon(
          Icons.message,
          color: Colors.white,
        ),
        onPressed: () {
          showDialog(
            context: context, // <<----
            barrierDismissible: true,
            useSafeArea: true,

            builder: (BuildContext context) {
              return Dialog(
                child: Container(
                  height: 200,
                  width: 100,
                  padding: const EdgeInsets.all(20),
                  color: AppColor.backgroundClr,
                  child: Column(
                    children: [
                      Text(
                        'कुनै एउटा छनुहोस्',
                        style: subtitleStyle.copyWith(color: Colors.black87),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Card(
                              elevation: 3,
                              shadowColor: Colors.black54,
                              color: Colors.white,
                              child: SvgPicture.asset(
                                AppIcons.fb,
                                height: 60,
                              ),
                            ),
                            Card(
                              elevation: 3,
                              shadowColor: Colors.black54,
                              color: Colors.white,
                              child: SvgPicture.asset(
                                AppIcons.sms,
                                height: 60,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        child: MaterialButton(
          onPressed: () {},
          height: 30.sp,
          elevation: 3,
          color: AppColor.primaryClr,
          child: Text('EMERGENCY CALL',
              style: titleStyle.copyWith(color: Colors.white)),
        ),
      ),
    );
  }

  buildSuryadayaCard(img, title, ontap) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: Device.orientation == Orientation.portrait ? 17.h : 40.h,
        width: 45.w,
        decoration: BoxDecoration(
            color: const Color.fromARGB(209, 255, 255, 255),
            border: Border.all(color: Colors.grey.shade300, width: 0.5),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 2, offset: Offset(0, 1))
            ],
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            img,
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: subtitleStyle,
            )
          ],
        ),
      ),
    );
  }

  buildGrid() {
    return Wrap(
      runSpacing: 5,
      spacing: 5,
      children: [
        buildSuryadayaCard(
            Icon(
              Icons.audio_file_outlined,
              size: 30.sp,
              color: AppColor.primaryClr,
            ),
            controller.isNepali.value ? 'सुरक्षा सन्देश' : "Security message",
            () {
          Get.to(() => const NotUploaded(
                title: 'सुरक्षा सन्देश',
              ));
        }),
        buildSuryadayaCard(
            Icon(
              Icons.report_gmailerrorred_outlined,
              size: 30.sp,
              color: AppColor.primaryClr,
            ),
            controller.isNepali.value ? 'घटना रिपोट' : "Incident Report", () {
          Get.to(() => GhatanaReport());
        }),
        buildSuryadayaCard(
            Icon(
              Icons.warning_amber_sharp,
              size: 30.sp,
              color: AppColor.primaryClr,
            ),
            controller.isNepali.value ? 'सुचना' : "Information", () {
          Get.to(() => const NotUploaded(
                title: 'सुचना',
              ));
        }),
        buildSuryadayaCard(
            Icon(
              Icons.local_phone_outlined,
              size: 30.sp,
              color: AppColor.primaryClr,
            ),
            controller.isNepali.value
                ? 'सम्पूर्ण प्रहरी इकाईको फोन न'
                : "Police phone no.", () {
          Get.to(() => const NotUploaded(
                title: 'सम्पूर्ण प्रहरी इकाईको फोन न',
              ));
        }),
        buildSuryadayaCard(
            Icon(
              Icons.book_outlined,
              size: 30.sp,
              color: AppColor.primaryClr,
            ),
            controller.isNepali.value ? 'नागरिक वदापत्र' : "Citizen's Charter",
            () {
          Get.to(() => const NotUploaded(
                title: 'नागरिक वदापत्र',
              ));
        }),
        buildSuryadayaCard(
            Transform.rotate(
              angle: 55,
              child: Icon(
                Icons.man_rounded,
                size: 30.sp,
                color: AppColor.primaryClr,
              ),
            ),
            controller.isNepali.value
                ? 'पहिचान नखुलेको लास '
                : "Unidentified body", () {
          Get.to(() => const NotUploaded(
                title: 'पहिचान नखुलेको लास',
              ));
        }),
      ],
    );
  }
}
