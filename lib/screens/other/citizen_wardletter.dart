import 'package:flutter/material.dart';
import 'package:gandakimun/widget/appbar.dart';

import '../../constants.dart';

class CitizenWardletter extends StatelessWidget {
  const CitizenWardletter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar('नागरीक वडापत्र'),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [...List.generate(5, (index) => buildWadaTile())],
        ),
      ),
    );
  }

  buildWadaTile() {
    return Container(
      height: 50,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: const Color.fromARGB(209, 255, 255, 255),
          border: Border.all(color: Colors.grey.shade300, width: 0.5),
          boxShadow: const [
            BoxShadow(
                color: Colors.black26, blurRadius: 2, offset: Offset(0, 1))
          ],
          borderRadius: BorderRadius.circular(5)),
      child:
          const Align(alignment: Alignment.centerLeft, child: Text('no data')),
    );
  }
}
