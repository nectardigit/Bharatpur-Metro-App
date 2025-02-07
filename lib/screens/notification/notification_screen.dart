import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gandakimun/screens/notification/push_notifications_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants.dart';
import 'general_notifications_screen.dart';

class NotificationView extends StatefulWidget {
  int index;

  NotificationView({Key? key, required this.index}) : super(key: key);

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView>
    with SingleTickerProviderStateMixin {
  late TabController _controllerTab;

  @override
  void initState() {
    super.initState();
    _controllerTab =
        TabController(length: 2, vsync: this, initialIndex: widget.index);
  }

  @override
  void dispose() {
    _controllerTab.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 16,
            ),
          ),
          centerTitle: true,
          title: const Text(
            'Notifications',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          bottom: TabBar(
            indicatorColor: AppColor.red,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 4,
            labelStyle: subtitleStyle.copyWith(
                fontSize: 16.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold),
            unselectedLabelStyle: subtitleStyle.copyWith(
                fontSize: 16.sp,
                color: Colors.white,
                fontWeight: FontWeight.normal),
            indicator: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 2.0, color: Colors.red),
              ),
            ),
            controller: _controllerTab,
            tabs: const [
              Tab(text: 'Inbox'),
              Tab(text: 'Push Notification'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _controllerTab,
          children: <Widget>[
            const GeneralNotificationScreen(),
            PushNotificationScreen(),
          ],
        ),
      ),
    );
  }
}
