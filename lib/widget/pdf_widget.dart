import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:gandakimun/widget/heading.dart';

class PdfWidget extends StatefulWidget {
  final File file;
  final String url;

  PdfWidget({Key? key, required this.file, required this.url})
      : super(key: key);

  @override
  _PdfWidgetState createState() => _PdfWidgetState();
}

class _PdfWidgetState extends State<PdfWidget> {
  final controller = Get.find<AppController>();
  bool _isDownloading = false; // Track download progress

  @override
  Widget build(BuildContext context) {
    final name = basename(widget.file.path);

    return SafeArea(
      child: Scaffold(
        appBar: buildAppbar(name),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(flex: 5, child: buildHeading(name)),
                Expanded(
                  flex: 1,
                  child: _isDownloading
                      ? Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        )
                      : IconButton(
                          onPressed: () => _startDownload(name),
                          icon: Icon(
                            Icons.download_sharp,
                            size: 25.sp,
                            color: Colors.blue,
                          ),
                        ),
                ),
              ],
            ),
            const Divider(thickness: 2),
            Expanded(
              child: PDFView(filePath: widget.file.path),
            ),
          ],
        ),
      ),
    );
  }

  /// Starts the file download process
  Future<void> _startDownload(String fileName) async {
    setState(() {
      _isDownloading = true;
    });

    final file = await _downloadFile(widget.url, fileName);

    setState(() {
      _isDownloading = false;
    });

    if (file != null) {
      log('Downloaded file path: ${file.path}', name: 'Download Success');
      Get.snackbar("Success", "File downloaded successfully!",
          backgroundColor: Colors.green, colorText: Colors.white);
      OpenFile.open(file.path);
    } else {
      log('Download failed', name: 'Download Error');
      Get.snackbar("Error", "Failed to download file.",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  /// Downloads the file from the given URL and saves it to local storage
  Future<File?> _downloadFile(String url, String name) async {
    try {
      final appStorage = await getApplicationDocumentsDirectory();
      final filePath =
          '${appStorage.path}/${basenameWithoutExtension(name)}.pdf';
      final file = File(filePath);

      final response = await Dio().get(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveTimeout: Duration(minutes: 1).inMilliseconds,
        ),
      );

      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();

      return file;
    } catch (e) {
      if (e is DioError) {
        log('DioError: ${e.response?.statusCode} - ${e.message}',
            name: 'Download Error');
      } else {
        log('Unexpected Error: $e', name: 'Download Error');
      }
      return null;
    }
  }
}
