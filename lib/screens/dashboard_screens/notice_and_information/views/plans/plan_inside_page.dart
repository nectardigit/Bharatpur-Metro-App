import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/screens/other/badaptarScreen.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/heading.dart';
import 'package:gandakimun/widget/webview_widget.dart';

class PlanInsidePage extends StatelessWidget {
  final List list;

  PlanInsidePage({Key? key, required this.list}) : super(key: key);

  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: AppColor.backgroundClr,
        appBar: buildAppbar(controller.isNepali.value ? 'योजनाहरु' : 'Plans'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              buildHeading(controller.isNepali.value ? 'योजनाहरु' : 'Plans'),
              const SizedBox(height: 10),
              SizedBox(
                height: size.height * .82,
                width: size.width * .98,
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.blue,
                      child: ExpansionTile(
                        initiallyExpanded: true,
                        title: Text(
                            controller.isNepali.value
                                ? list[index].title!.np.toString()
                                : list[index].title!.en.toString(),
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: titleStyle.copyWith(color: Colors.white)),
                        children: <Widget>[
                          Container(
                            color: Colors.white,
                            child: Html(
                              data: controller.isNepali.value
                                  ? list[index].details!.np.toString()
                                  : list[index].details!.en.toString(),
                              // onLinkTap: (url, _, __, ___) async {
                              //   // var isFile = false;
                              //   // var fileName =
                              //   //     list[index].title.en.toString();
                              //   // openFile(
                              //   //     url: url!,
                              //   //     fileName: fileName,
                              //   //     isFile: isFile);
                              //
                              //   Get.to(() => WebviewWidget(
                              //       title: controller.isNepali.value
                              //           ? 'नागरीक वडापत्र'
                              //           : "Plans",
                              //       url: url!));
                              //   // Get.to(() => BadaPatraScreen());
                              //
                              //   log("Opening $url...");
                              // }
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ));
  }

  Future openFile({required String url, String? fileName, bool? isFile}) async {
    final file = await downloadFile(url, fileName!);
    if (file == null) return null;
    isFile = true;

    log('Path: ${file.path}', name: 'Open File');
    OpenFile.open(file.path);
  }

  Future<File?> downloadFile(String url, String name) async {
    try {
      final appStorage = await getApplicationDocumentsDirectory();
      final file = File('${appStorage.path}/$name');
      final response = await Dio().get(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveTimeout: 0,
        ),
      );
      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();

      return file;
    } catch (e) {
      log(e.toString(), name: 'download Law error');
      return null;
    }
  }
}
