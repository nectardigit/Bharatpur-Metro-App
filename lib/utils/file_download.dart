import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import '../constants.dart';
import '../widget/snackbar.dart';

class DioFileDownlaod {
  bool isDownloading = false;

  Future<void> startDownloading(String file, BuildContext context) async {
    if (isDownloading) return;
    isDownloading = true;
    if (await _requestStoragePermission()) {
      var dir = await DownloadsPathProvider.downloadsDirectory;
      if (dir != null) {
        String saveName = file.split('/').last;
        String savePath = "${dir.path}/$saveName";
        // if (kDebugMode) print("Saving to: $savePath");
        try {
          _showDownloadProgress(context);
          await Dio().download(file, savePath,
              onReceiveProgress: (received, total) {
            // if (total != -1) {
            //   double progress = (received / total * 100);
            //   if (kDebugMode)
            //     print("Downloading: ${progress.toStringAsFixed(0)}%");
            // }
          });
          Navigator.pop(context);
          getSnackbar(
            bgColor: AppColor.mainClr,
            message: "Download successful! Check your Downloads folder.",
          );

          //  if (kDebugMode) print("File saved successfully!");
        } catch (e) {
          // if (kDebugMode) print("Download error: ${e.toString()}");
          Navigator.pop(context);
        }
      }
    } else {
      openAppSettings();
    }

    isDownloading = false;
  }

  void _showDownloadProgress(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator.adaptive(),
              SizedBox(height: 20),
              Text(
                "Downloading...",
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<bool> _requestStoragePermission() async {
    if (Platform.isAndroid) {
      if (await Permission.storage.isGranted ||
          await Permission.manageExternalStorage.isGranted ||
          await Permission.photos.isGranted ||
          await Permission.videos.isGranted ||
          await Permission.audio.isGranted) {
        return true;
      }
      if (await Permission.storage.request().isGranted ||
          await Permission.manageExternalStorage.request().isGranted ||
          await Permission.photos.request().isGranted ||
          await Permission.videos.request().isGranted ||
          await Permission.audio.request().isGranted) {
        return true;
      }
    }
    return false;
  }
}
