import 'package:flutter/material.dart';
import 'package:gandakimun/widget/appbar.dart';

import '../../widget/other_informations.dart';

class OthersDetailPage extends StatelessWidget {
  const OthersDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppbar("Other Information"),
        body: Column(
          children: [
            OtherInformations(),
          ],
        ));
  }
}
