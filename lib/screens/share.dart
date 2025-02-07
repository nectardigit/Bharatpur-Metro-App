
import 'package:flutter/material.dart';
import 'package:gandakimun/constants.dart';
import 'package:share_plus/share_plus.dart';

import '../widget/drawer.dart';

class QrCode extends StatelessWidget {
  const QrCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.isNepali.value ? "सेयर गर्नुहोस्" : "Share"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(70.0),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              // CustomPaint(
              //   // painter: Painter(),
              //   painter: QrPainter(
              //       data:
              //           'https://play.google.com/store/apps/details?id=com.nectardigit.gandakimun',
              //       options: const QrOptions(
              //           shapes: QrShapes(
              //               darkPixel:
              //                   QrPixelShapeRoundCorners(cornerFraction: .5),
              //               frame:
              //                   QrFrameShapeRoundCorners(cornerFraction: .25),
              //               ball: QrBallShapeRoundCorners(cornerFraction: .25)),
              //           colors: QrColors(
              //               dark: QrColorLinearGradient(colors: [
              //             Color.fromARGB(255, 2, 28, 35),
              //             Color.fromARGB(255, 4, 57, 92)
              //           ], orientation: GradientOrientation.leftDiagonal)))),
              //   size: const Size(250, 250),
              // ),
              const Text(
                "Scan for Share",
                style: TextStyle(
                    color: Color.fromARGB(255, 4, 57, 92),
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  shareApp();
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Center(
                      child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "Share via Social Media",
                      style: TextStyle(
                          color: AppColor.primaryClr,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> shareApp() async {
    await Share.share(
      'https://play.google.com/store/apps/details?id=com.nectardigit.gandakimun',
      subject: 'Check out this app!!!(Gandaki Rural Municipality)',
    );
  }
}
