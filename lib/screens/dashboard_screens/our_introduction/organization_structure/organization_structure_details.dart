import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/organization_structure_model.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/heading.dart';
import 'package:url_launcher/url_launcher.dart';
// ignore: depend_on_referenced_packages
import 'package:html/dom.dart' as dom;

class OrganizationDetailsPage extends StatelessWidget {
  final OrganizationStructureData list;
  OrganizationDetailsPage({Key? key, required this.list}) : super(key: key);
  final controller = Get.put(AppController());
  final staticAnchorKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(controller.isNepali.value
          ? 'संगठन संरचना'
          : 'Organization structure'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          buildHeading(controller.isNepali.value
              ? "संगठन संरचना"
              : 'Organization structure'),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              controller.isNepali.value
                  ? list.heading!.np.toString()
                  : list.heading!.np.toString(),
              style: titleStyle,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Html(
                  shrinkWrap: true,
                  anchorKey: staticAnchorKey,
                  data: list.details!.en != null
                      ? controller.isNepali.value
                          ? list.details!.np.toString()
                          : list.details!.en.toString()
                      : '',
                  // onLinkTap: (String? url,
                  //     RenderContext context,
                  //     Map<String, String> attributes,
                  //     dom.Element? element) async {
                  //   await launchUrl(Uri.parse(url!));
                  // },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
