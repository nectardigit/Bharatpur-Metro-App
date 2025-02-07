import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/screens/dashboard_screens/download_page/widgets/downloads_column_title_widget.dart';
import 'package:gandakimun/utils/pdf_api.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/heading.dart';
import 'package:gandakimun/widget/pdf_widget.dart';
import 'package:get/get.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';

class FormsOfApplicationPage extends StatelessWidget {
  FormsOfApplicationPage({Key? key}) : super(key: key);
  final controller = Get.put(AppController());

  initState() {
    controller.getImportantForm();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var list = controller.importantFormList;
    TextStyle style = subtitleStyle.copyWith(color: Colors.black);
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(controller.isNepali.value
          ? 'महत्त्वपूर्ण फारम'
          : 'Forms of Application'),
      body: Obx(
        () => Column(
          children: [
            const SizedBox(
              height: 20,
                ),
                buildHeading(controller.isNepali.value
                ? 'महत्त्वपूर्ण फारम'
                : 'Forms of Application'),
                const SizedBox(
                  height: 20,
                ),
                DownloadsColumnHeaderWidget(),
                Expanded(
              child: SizedBox(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Container(
                              color: Colors.white,
                              width: size.width * 1.4,
                              height: size.height * 0.08,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.all(2),
                                    width: size.width * 0.4,
                                    child: Text(
                                        controller.isNepali.value
                                            ? list[index].title!.np.toString()
                                            : list[index]
                                                .title!
                                                .en
                                                .toString()
                                                .toString(),
                                        textAlign: TextAlign.start,
                                        style: style),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(2),
                                    width: size.width * 0.2,
                                    child: Text(
                                        list[index]
                                            .fiscalYear
                                            .toString()
                                            .split(" ")[0],
                                        textAlign: TextAlign.start,
                                        style: style),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(2),
                                        width: size.width * 0.075,
                                        child: GestureDetector(
                                          onTap: () {
                                            var url =
                                                list[index].files.toString();
                                            var fileName = list[index]
                                                .title!
                                                .en
                                                .toString();
                                            log(url.toString(), name: url);
                                            openFile(
                                                url: url,
                                                fileName: '$fileName.pdf');
                                          },
                                          child: const Icon(
                                            Icons.download,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(2),
                                        width: size.width * 0.075,
                                        child: GestureDetector(
                                          onTap: () async {
                                            var url =
                                                list[index].files.toString();
                                            final file =
                                                await PDFApi.loadNetwork(url);
                                            openPdf(file, url);
                                          },
                                          child: const Icon(
                                            Icons.remove_red_eye,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
      ),
    );
  }

  Future openFile({required String url, String? fileName}) async {
    final file = await downloadFile(url, fileName!);
    if (file == null) return null;

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

  openPdf(File file, String url) {
    Get.to(() => PdfWidget(
      file: file,
      url: url,
    ));
  }
}
