import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:html/parser.dart' as htmlParser;
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/utils/file_download.dart';
import 'package:gandakimun/widget/nodata.dart';
import 'dart:developer';

import '../../constants.dart';
import '../../model/notificatiob_model.dart';
import '../../model/push_notification.dart';

class NotificationDetailScreen extends StatefulWidget {
  const NotificationDetailScreen({
    Key? key,
    this.noticeHeadingModel,
    this.pushNotification,
    required this.type,
  }) : super(key: key);

  final String type;
  final NotificationData? noticeHeadingModel;
  final PushNotificationData? pushNotification;

  @override
  State<NotificationDetailScreen> createState() =>
      _NotificationDetailScreenState();
}

class _NotificationDetailScreenState extends State<NotificationDetailScreen> {
  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.isNepali.value ? 'सुचना' : 'Notification'),
      ),
      body: widget.type == "general"
          ? _buildGeneralNotification()
          : _buildPushNotification(),
    );
  }

  Widget _buildGeneralNotification() {
    if (widget.noticeHeadingModel!.files!.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.noticeHeadingModel!.title != null
                              ? controller.isNepali.value
                                  ? widget.noticeHeadingModel!.title!.np
                                      .toString()
                                  : widget.noticeHeadingModel!.title!.en
                                      .toString()
                              : '',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(35, 74, 131, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // IconButton(
                //   onPressed: () {
                //     setState(() {
                //       DioFileDownlaod().startDownloading(
                //           widget.noticeHeadingModel!.files!, context);
                //     });
                //   },
                //   icon: const Material(
                //       color: Colors.transparent, child: Icon(Icons.download)),
                // )
              ],
            ),
            widget.noticeHeadingModel!.published != null
                ? Text(
                    'Submited on: ${widget.noticeHeadingModel!.published.toString()}',
                    style: subtitleStyle,
                  )
                : const SizedBox(),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 2,
            ),
            if (widget.noticeHeadingModel!.files == null)
              const Center(
                child: Text('No Files Found'),
              ),
            if (widget.noticeHeadingModel!.files != null)
              widget.noticeHeadingModel!.files!.endsWith('.pdf')
                  ? Expanded(
                      child: SfPdfViewer.network(
                        widget.noticeHeadingModel!.files!,
                      ),
                    )
                  : Image.network(widget.noticeHeadingModel!.files.toString())
          ],
        ),
      );
    } else {
      return buildNodata();
    }
  }

  Widget _buildPushNotification() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            controller.isNepali.value
                ? decodeHtmlData(widget.pushNotification!.title!.np.toString())
                : decodeHtmlData(widget.pushNotification!.title!.en.toString()),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Row(
            children: [
              widget.pushNotification!.published == null
                  ? const Text("")
                  : Text(
                      formatDateString(
                          widget.pushNotification!.published.toString()),
                      style: const TextStyle(
                        fontStyle: FontStyle.normal,
                      )),
              Text(" | "),
              Text(
                formatTimeString(widget.pushNotification!.time.toString()),
                style: const TextStyle(
                  fontStyle: FontStyle.normal,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          widget!.pushNotification!.files!.endsWith(".pdf")
              ? Expanded(
                  child: SfPdfViewer.network(
                      widget!.pushNotification!.files.toString()),
                )
              : Image.network(
                  widget!.pushNotification!.files.toString(),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
          const SizedBox(height: 8.0),
          Text(
            controller.isNepali.value
                ? decodeHtmlData(
                    widget.pushNotification!.description!.np.toString())
                : decodeHtmlData(
                    widget.pushNotification!.description!.en.toString()),
          ),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }

  static decodeHtmlData(String? encodedData) {
    if (encodedData != null) {
      var dom = htmlParser.parse(encodedData);
      return dom.body!.text;
    }
    return '';
  }

  String formatDateString(String inputDate) {
    // Parse the input string to DateTime
    DateTime date = DateTime.parse(inputDate);

    // Format the date
    String formattedDate = DateFormat('dd MMM yyyy').format(date);

    return formattedDate;
  }

  String formatTimeString(String inputTime) {
    // Parse the input string to TimeOfDay
    List<String> timeParts = inputTime.split(':');
    TimeOfDay timeOfDay = TimeOfDay(
      hour: int.parse(timeParts[0]),
      minute: int.parse(timeParts[1]),
    );

    // Format the time
    String formattedTime = DateFormat.jm().format(DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      timeOfDay.hour,
      timeOfDay.minute,
    ));

    return formattedTime;
  }
}
