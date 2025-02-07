import 'package:flutter/material.dart';
import 'package:gandakimun/constants.dart';

import '../../../widget/appbar.dart';

class ItemRequestedListScreen extends StatelessWidget {
  const ItemRequestedListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar('Item Requested List'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTable(),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildTable() {
    return Table(
      border: TableBorder.all(width: 1, color: Colors.black),
      children: [
        TableRow(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Sn.',
                  style: subtitleStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Date',
                  style: subtitleStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Item request no.',
                  style: subtitleStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Status(Approved or pending)',
                  style: subtitleStyle,
                ),
              ),
            ]),
        TableRow(
            decoration:
                BoxDecoration(border: Border.all(color: Colors.black38)),
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  '',
                  style: subtitleStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  '',
                  style: subtitleStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  '',
                  style: subtitleStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  '',
                  style: subtitleStyle,
                ),
              ),
            ]),
        TableRow(
            decoration:
                BoxDecoration(border: Border.all(color: Colors.black38)),
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  '',
                  style: subtitleStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  '',
                  style: subtitleStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  '',
                  style: subtitleStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  '',
                  style: subtitleStyle,
                ),
              ),
            ]),
      ],
    );
  }
}
