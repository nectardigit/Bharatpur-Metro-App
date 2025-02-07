import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/screens/home/controller.dart/homeController.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/nodata.dart';

import '../../constants.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({Key? key}) : super(key: key);

  final controller = Get.put(AppController());
  final homePagecontroller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(
          controller.isNepali.value ? 'समाचार, घटना र सूचनाहरू' : 'News'),
      body: DefaultTabController(
        length: 3,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: AppColor.primaryClr,
                  // borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(10),
                  //     topRight: Radius.circular(10)),
                ),
                child: const TabBar(
                  indicatorColor: Colors.red,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 4,
                  labelStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  unselectedLabelStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.normal),
                  tabs: [
                    Tab(
                      child: Text(
                        'News',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Events',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Notice',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: TabBarView(children: <Widget>[
                  Obx(() => homePagecontroller.newsModel.data!=null
                      ? ListView.builder(
                          itemCount: homePagecontroller.newsModel.data!.length,
                          itemBuilder: ((context, index) {
                            var data = homePagecontroller.newsModel.data![index];
                            return data.status == 1
                                ? buildNewsList(
                                    data.image,
                                    controller.isNepali.value
                                        ? data.title!.np
                                        : data.title!.en,
                                    controller.isNepali.value
                                        ? data.description!.np
                                        : data.description!.en,
                                    data.date)
                                : Container();
                          }))
                      : buildNodata()),
                  Obx(() => controller.eventlist.isNotEmpty
                      ? ListView.builder(
                          itemCount: controller.eventlist.length,
                          itemBuilder: (context, index) {
                            var data = controller.eventlist[index];
                            return data.status == 1
                                ? buildEventsTile(
                                    data.image,
                                    controller.isNepali.value
                                        ? data.title!.np
                                        : data.title!.en,
                                    controller.isNepali.value
                                        ? data.description!.np
                                        : data.description!.en,
                                    data.date)
                                : Container();
                          },
                        )
                      : buildNodata()),
                  const Center(
                    child: Text(
                        'There is currently no content classified with this term.'),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildNewsList(leading, title, subtitle, date) {
    return ListTile(
      leading: SizedBox(
          height: 150,
          width: 100,
          child: CachedNetworkImage(
            imageUrl: leading,
            placeholder: (context, url) => const Center(
                child: SizedBox(
                    height: 50, width: 50, child: CircularProgressIndicator())),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fit: BoxFit.cover,
          )),
      title: Text(title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text(subtitle), Text(date)],
      ),
    );
  }

  buildEventsTile(img, title, description, date) {
    return ListTile(
      leading: SizedBox(
        height: 60,
        width: 80,
        child: CachedNetworkImage(
          imageUrl: img,
          fit: BoxFit.cover,
          placeholder: (context, url) => const SizedBox(
              height: 50, width: 50, child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
      title: Text(
        title,
        style: subtitleStyle.copyWith(fontSize: 16),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            description,
            style: subtitleStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(date)
        ],
      ),
    );
  }
}
