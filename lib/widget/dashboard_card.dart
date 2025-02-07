import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gandakimun/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard(
      {Key? key, required this.img, required this.title, this.ontap})
      : super(key: key);

  final String img;
  final String title;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: ontap,
        child: Device.orientation == Orientation.portrait
            ? Container(
                height: 17.h,
                width: 30.w,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.blue.shade300, width: 0.9),
                    borderRadius: BorderRadius.circular(0.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      img,
                      height: 40.0,
                      width: 40.0,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                        child: Text(title,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w600)))
                  ],
                ))
            : Container(
                // height: 130,
                // width: 120,
                height: 35.h,
                width: 17.w,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(209, 255, 255, 255),
                    border: Border.all(color: Colors.grey.shade300, width: 0.5),
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      img,
                      height: 40.0,
                      width: 40.0,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      title,
                      style: subtitleStyle,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    )
                  ],
                )));
  }
}

class DashboardPngCard extends StatelessWidget {
  const DashboardPngCard(
      {Key? key, required this.img, required this.title, this.ontap})
      : super(key: key);

  final String img;
  final String title;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: ontap,
        child: Device.orientation == Orientation.portrait
            ? Container(
                // height: 130,
                // width: 120,
                height: 17.h,
                width: 30.w,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(209, 255, 255, 255),
                    border: Border.all(color: Colors.grey.shade300, width: 0.5),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 2,
                          offset: Offset(0, 1))
                    ],
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      img,
                      height: 50.0,
                      width: 50.0,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(title, style: subtitleStyle)
                  ],
                ))
            : Container(
                // height: 130,
                // width: 120,
                height: 30.h,
                width: 17.w,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(209, 255, 255, 255),
                    border: Border.all(color: Colors.grey.shade300, width: 0.5),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 2,
                          offset: Offset(0, 1))
                    ],
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(img, fit: BoxFit.contain),
                    // SvgPicture.asset(
                    //   img,
                    //   height: 50.0,
                    //   width: 50.0,
                    //   allowDrawingOutsideViewBox: true,
                    //   fit: BoxFit.contain,
                    // ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(title, style: subtitleStyle)
                  ],
                )));
  }
}
