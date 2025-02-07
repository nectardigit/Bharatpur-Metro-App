// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/screens/dashboard_screens/our_introduction/city_scape_photos/city_scape_photos.dart';
import 'package:gandakimun/screens/dashboard_screens/our_introduction/controller/our_information.dart';
import 'package:gandakimun/screens/dashboard_screens/our_introduction/job_description_page/job_description_page.dart';
import 'package:gandakimun/screens/dashboard_screens/our_introduction/organization_structure/organization_structure.dart';
import 'package:gandakimun/screens/dashboard_screens/our_introduction/ward_offices/ward_office.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../widget/box_shadow.dart';
import '../../other/introduction_screen.dart';
import 'civil_ward_paper/filter_service_group.dart';
import 'employee_details/office_name_filter.dart';
import 'officer_details/officer_details.dart';

class OurIntroductionPage extends StatelessWidget {
  OurIntroductionPage({Key? key}) : super(key: key);
  final ourInformationController = Get.put(OurInformationController());
  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(
          controller.isNepali.value ? 'हाम्रो परिचय' : 'Our Introduction'),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => Column(
            children: [
              Center(
                child: GridView.count(
                    padding: const EdgeInsets.all(10),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    mainAxisSpacing: 12.0,
                    crossAxisSpacing: 12.0,
                    children: [
                      buildCard(
                          controller.isNepali.value
                              ? 'संलिप्त परिचय'
                              : 'Our Introduction',
                          Icons.person, () {
                        Get.to(() => IntroductionScreen());
                      }),
                      buildCard(
                          controller.isNepali.value
                              ? 'संगठन संरचना'
                              : 'Organization structure',
                          Icons.group, () {
                        Get.to(() => OrganizationStructure());
                      }),
                      buildCard(
                          controller.isNepali.value
                              ? 'जनप्रतिनिधि हरु'
                              : 'People representatives',
                          Icons.details_outlined, () {
                        Get.to(() => OfficeDetails());
                      }),
                      buildCard(
                          controller.isNepali.value ? 'कर्मचारी' : 'Staffs',
                          Icons.person_pin, () {
                        Get.to(OfficeNameFilterScreen(
                            // text: 'Tax Payer Service Center',
                            ));
                      }),
                      buildCard(
                          controller.isNepali.value
                              ? 'कार्यविवरण'
                              : 'Job description',
                          Icons.description, () {
                        Get.to(() => JobDescriptionPage());
                      }),
                      buildCard(
                          controller.isNepali.value
                              ? 'वार्ड कार्यालयहरु'
                              : 'Wards',
                          Icons.workspaces_filled, () {
                        Get.to(() => WardOffices());
                      }),
                      // buildCard(
                      //     controller.isNepali.value
                      //         ? ' प्रशासनिक सेवा '
                      //         : 'Administrative Unit',
                      //     Icons.local_activity, () {
                      //   Get.to(() => ServiceCenter());
                      // }),
                      buildCard(
                          controller.isNepali.value
                              ? 'नागरिक वडापत्र'
                              : 'Citizen Charter',
                          Icons.folder, () {
                        Get.to(() => FilterServiceGroupFromCivil());
                      }),
                      buildCard(
                          controller.isNepali.value
                              ? 'नगर पार्श्व चित्र'
                              : "Municipal Profile",
                          Icons.photo, () {
                        Get.to(() => CityScapePhotosPage());
                      }),
                    ]),
              )
            ],
          ),
        ),
      )),
    );
  }

  buildCard(title, IconData icon, ontap) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 35.w,
        width: 45.w,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [buildBoxShadow()],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: AppColor.primaryClr,
                size: 30.sp,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: subtitleStyle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class SamasyaDarta extends StatelessWidget {
//   SamasyaDarta({Key? key}) : super(key: key);

//   final controller = Get.put(HomeController());
//   final appcontroller = Get.put(AppController());

//   final complaintTypes = TextEditingController();
//   final complaintDescription = TextEditingController();
//   final name = TextEditingController();
//   final email = TextEditingController();
//   final address = TextEditingController();
//   final phone = TextEditingController();
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.backgroundClr,
//       appBar: buildAppbar('समस्य तथा सुजव दार्ता'),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   'गुनासोको प्रकार',
//                   style: subtitleStyle,
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 TextFormField(
//                   validator: (val) => validateIsEmpty(string: val.toString()),
//                   controller: complaintTypes,
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   'गुनासोको विवरण',
//                   style: subtitleStyle,
//                 ),
//                 TextFormField(
//                   controller: complaintDescription,
//                   decoration: InputDecoration(
//                     hintText: '',
//                     hintStyle: subtitleStyle.copyWith(
//                         color: Colors.black.withOpacity(0.5)),
//                   ),
//                   validator: (val) => validateIsEmpty(string: val.toString()),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 ListTile(
//                   contentPadding: EdgeInsets.zero,
//                   title: Text(
//                     'अत्तिरिक्त् कागजात अप्लोअद गर्नुहोस् (यधी कुनै हो भने) ',
//                     style: subtitleStyle,
//                   ),
//                   trailing: IconButton(
//                       onPressed: () {},
//                       icon: const Icon(
//                         Icons.warning_amber_rounded,
//                         size: 30,
//                         color: Colors.amber,
//                       )),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     MaterialButton(
//                       color: AppColor.primaryClr,
//                       onPressed: () {
//                         controller.getImage();
//                       },
//                       child: Text(
//                         'select a photo',
//                         style: subtitleStyle.copyWith(color: Colors.white),
//                       ),
//                     ),
//                     MaterialButton(
//                       color: AppColor.primaryClr,
//                       onPressed: () {
//                         controller.getFile();
//                       },
//                       child: Text(
//                         'Attach a file',
//                         style: subtitleStyle.copyWith(color: Colors.white),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Obx(() => controller.selectedImagePath != ""
//                     ? Text(controller.selectedImagePath.toString())
//                     : Container()),
//                 Obx(() => controller.selectedFilePath != ""
//                     ? Text(controller.selectedFilePath.toString())
//                     : Container()),
//                 ListTile(
//                   contentPadding: EdgeInsets.zero,
//                   title: Text(
//                     'के तपाईं आफ्नो व्यक्तिगत विवरण प्रदान गर्न चाहनुहुन्छ ?',
//                     style: subtitleStyle,
//                   ),
//                   trailing: IconButton(
//                       onPressed: () {},
//                       icon: const Icon(
//                         Icons.warning_amber_rounded,
//                         size: 30,
//                         color: Colors.amber,
//                       )),
//                 ),
//                 Obx(
//                   () => Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       MaterialButton(
//                         child: const Text('Yes'),
//                         color: controller.yes.value
//                             ? Colors.amber
//                             : Colors.transparent,
//                         onPressed: () {
//                           controller.yes.value = true;
//                         },
//                       ),
//                       const SizedBox(
//                         width: 40,
//                       ),
//                       MaterialButton(
//                         child: const Text('No'),
//                         color: controller.yes.value
//                             ? Colors.transparent
//                             : Colors.amber,
//                         onPressed: () {
//                           controller.yes.value = false;
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//                 Obx(() => controller.yes.value
//                     ? Column(
//                         children: [
//                           CustomTextfield(
//                             label: 'नाम',
//                             icon: Icons.person,
//                             controller: name,
//                             validator: (val) =>
//                                 validateIsEmpty(string: val.toString()),
//                           ),
//                           CustomTextfield(
//                             label: 'ठेगान ',
//                             icon: Icons.location_on,
//                             controller: address,
//                             validator: (val) =>
//                                 validateIsEmpty(string: val.toString()),
//                           ),
//                           CustomTextfield(
//                             label: 'नम्बर',
//                             icon: Icons.phone,
//                             controller: phone,
//                             validator: (val) =>
//                                 validateIsEmpty(string: val.toString()),
//                           ),
//                           CustomTextfield(
//                             label: 'ईमेल',
//                             icon: Icons.mail,
//                             controller: email,
//                             validator: (val) =>
//                                 validateIsEmpty(string: val.toString()),
//                           ),
//                           CustomTextfield(
//                             label: 'फ्याक्स नम्बर',
//                             icon: Icons.fax,
//                             validator: (val) =>
//                                 validateIsEmpty(string: val.toString()),
//                           )
//                         ],
//                       )
//                     : Container()),
//                 customButton(
//                   'पेश गर्नुहोस् ',
//                   () {
//                     if (_formKey.currentState!.validate()) {
//                       appcontroller.postProblemStatement(
//                         complaintTypes.text,
//                         complaintDescription.text,
//                         name.text,
//                         email.text,
//                         controller.selectedImagePath.toString(),
//                         address.text,
//                         phone.text,
//                       );
//                     } else {
//                       getSnackbar(bgColor: AppColor.red, message: 'दर्ता असफल');
//                     }
//                   },
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


