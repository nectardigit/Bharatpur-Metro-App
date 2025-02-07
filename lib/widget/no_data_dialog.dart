import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gandakimun/constants.dart';

class NoDataErrorBox extends StatelessWidget {
  const NoDataErrorBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset('assets/no_data.png'),
          const Text('Under Development Phase'),
          Container(
            alignment: Alignment.center,
            color: Colors.transparent,
            child: const SpinKitThreeInOut(
              color: Colors.blue,
              size: 70,
            ),
          )
        ],
      ),
    );
  }
}

class LoadingBox extends StatelessWidget {
  const LoadingBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          //Image.asset('assets/images/loading1.gif'),

          Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(width: 10),
              Text('Loading...',
                  textAlign: TextAlign.center, style: subtitleStyle),
            ],
          ),
        ],
      ),
    );
  }
}
