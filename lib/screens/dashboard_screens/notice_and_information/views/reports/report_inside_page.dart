import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/law.dart';
import 'package:gandakimun/screens/dashboard_screens/notice_and_information/views/gazette/widget/gazette_column_title_widget.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/heading.dart';
import 'package:gandakimun/widget/pdf_widget.dart';

class ReportInsidePage extends StatefulWidget {
  final String report;
  final int id;
  const ReportInsidePage({Key? key, required this.id, required this.report})
      : super(key: key);

  @override
  State<ReportInsidePage> createState() => _ReportInsidePageState();
}

class _ReportInsidePageState extends State<ReportInsidePage> {
  final controller = Get.put(AppController());

  @override
  void initState() {
    super.initState();
    switch (widget.report) {
      case 'annual':
        controller.getAnnualReportDetails(widget.id);
        break;
      case 'audit':
        controller.getAuditReportDetails(widget.id);
        break;
      case 'financial':
        controller.getFinancialStatementDetails(widget.id);

        break;
      case 'monitoring':
        controller.getMonitoringReportDetails(widget.id);

        break;
      case 'other':
        controller.getOtherStatementDetails(widget.id);
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextStyle style = subtitleStyle.copyWith(color: Colors.black);

    var list = widget.report == 'annual'
        ? controller.annualReportsDetailsList
        : widget.report == 'audit'
            ? controller.auditReportDataDetailsList
            : widget.report == 'financial'
                ? controller.financialStatementDataDetailsList
                : widget.report == 'monitoring'
                    ? controller.monitoringReportDataDetailsList
                    : widget.report == 'other'
                        ? controller.otherReportDataDetailsList
                        : null;

    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(controller.isNepali.value ? 'रिपोर्टहरू' : 'Reports'),
      body: SafeArea(
        child: Obx(
          () => list!.isEmpty
              ? Container(
                  alignment: Alignment.center,
                  color: Colors.black12,
                  child: const SpinKitCubeGrid(
                    color: Colors.indigoAccent,
                    size: 70,
                  ),
                )
              : Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    buildHeading(
                        controller.isNepali.value ? 'रिपोर्टहरू' : 'Reports'),
                    const SizedBox(
                      height: 20,
                    ),
                    GazetteColumnHeaderWidget(),
                    Expanded(
                      child: SingleChildScrollView(
                        child: SizedBox(
                          child: Column(
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: list.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    color: Colors.white,
                                    width: size.width * 1.4,
                                    height: size.height * 0.08,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          padding: const EdgeInsets.all(2),
                                          width: size.width * 0.3,
                                          child: Text(
                                              controller.isNepali.value
                                                  ? list[index]
                                                      .title!
                                                      .np
                                                      .toString()
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
                                                  .date
                                                  .toString()
                                                  .split(" ")[0],
                                              textAlign: TextAlign.start,
                                              style: style),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(2),
                                          width: size.width * 0.2,
                                          child: GestureDetector(
                                            onTap: () {
                                              var url =
                                                  list[index].files.toString();
                                              var fileName = list[index]
                                                  .title!
                                                  .en
                                                  .toString();
                                              log(url.toString(),
                                                  name: 'file Link');
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
                                      ],
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

  List<DataColumn> getColumns(
          List<String> columns, Function(int, bool)? onSort) =>
      columns
          .map((String column) => DataColumn(
                onSort: onSort,
                label: Text(
                  column,
                  style: subtitleStyle,
                ),
              ))
          .toList();

  List<DataRow> getRows(List<LawData> law) => law.map((law) {
        final cells = [law.title, law.title, law.title, law.title];
        return DataRow(cells: getCells(cells));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) => cells
      .map(
        (data) => DataCell(Text('$data')),
      )
      .toList();

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);
}
