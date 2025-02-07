import 'package:flutter/material.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class OfficeContactInfoScreen extends StatefulWidget {
  const OfficeContactInfoScreen({Key? key});

  @override
  State<OfficeContactInfoScreen> createState() =>
      _OfficeContactInfoScreenState();
}

class _OfficeContactInfoScreenState extends State<OfficeContactInfoScreen> {
  @override
  void initState() {
    super.initState();
    controller.fetchAbout();
  }

  final controller = Get.put(AppController());
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 10,
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount:1,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var data = controller.aboutlist[index];
              return Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(data.companyLogo.toString()),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            controller.isNepali.value ||
                                    data.companyName!.np != null
                                ? data.companyName!.np.toString()
                                : data.companyName!.en.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: Center(
                            child: Text(
                              controller.isNepali.value ||
                                      data.address!.np != null
                                  ? data.address!.np.toString()
                                  : data.address!.en.toString(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  buildOfficeContacts(
                    icon: Icons.phone,
                    text: 'Phone',
                    iconColor: Colors.blue,
                    subtitle: data.phone,
                    onTap: () {
                      homeController.makePhoneCall("tel:${data.phone}");
                    },
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.grey,
                  ),
                  buildOfficeContacts(
                    icon: Icons.mail,
                    text: 'Email',
                    iconColor: Colors.blue,
                    subtitle: data.email,
                    onTap: () {
                      final Uri emailLaunchUri = Uri(
                        scheme: 'mailto',
                        path: data.email,
                      );

                      launchUrl(emailLaunchUri);
                    },
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            launch(data.fbLink.toString());
                          },
                          child: Image.asset(
                            AppIcons.facebook,
                            width: 40,
                            height: 40,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            launch(data.youtubeLink.toString());
                          },
                          child: Image.asset(
                            AppIcons.youtube,
                            width: 50,
                            height: 50,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            launch(data.mapUrl.toString());
                          },
                          child: Image.asset(
                            AppIcons.map,
                            width: 40,
                            height: 40,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

Widget buildOfficeContacts({
  IconData? icon,
  String? text,
  Function()? onTap,
  Color? iconColor,
  String? subtitle,
}) {
  return ListTile(
      onTap: onTap,
      title: Text(
        text!,
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      leading: Icon(icon),
      subtitle: subtitle != null ? Text(subtitle) : const SizedBox());
}
