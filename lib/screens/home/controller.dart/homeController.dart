import 'dart:convert';
import 'dart:developer';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:get/get.dart';
import 'package:gandakimun/model/banner.dart';
import 'package:gandakimun/model/document_notice.dart';
import 'package:gandakimun/model/elected_officials.dart';
import 'package:gandakimun/model/news.dart';
import 'package:gandakimun/model/suchana_adhikari.dart';
import 'package:gandakimun/services/api_service.dart';
import 'package:gandakimun/utils/constants.dart';

class HomePageController extends GetxController implements GetxService {
  BannerModel bannerModel = BannerModel();
  NewsModel newsModel = NewsModel();
  ElectedOfficialsModel electedOfficialsModel = ElectedOfficialsModel();
  // SuchanaAdhikariModel suchanaAdhikariModel = SuchanaAdhikariModel();
  DoucmentNoticeModel noticeHeadingModel = DoucmentNoticeModel();
  @override
  void onInit() {
    initializers();
    super.onInit();
  }

  initializers() {
    // fetchBanner();
    // fetchNews();
    // fetchElectedOfficials();
    // fetchSuchanaAdhikari();
    // getDocumentNotice();
  }

  fetchRefresh() {
    update();
  }

  // fetchBanner() async {
  //   // var isCacheExist =
  //   //     await APICacheManager().isAPICacheKeyExist(ApiCacheKey.key);
  //   try {
  //     {
  //       await ApiService().getbanner().then((value) => {
  //             if (value != null) {bannerModel = BannerModel.fromJson(value)}
  //           });
  //     }
  //   } on Exception catch (e) {
  //     log(e.toString(), name: 'fetchBanner error');
  //   }
  // }

  // fetchNews() async {
  //   try {
  //     await ApiService().getnews().then((value) => {
  //           if (value != null) {newsModel = NewsModel.fromJson(value)}
  //         });
  //     update();
  //   } on Exception catch (e) {
  //     log(e.toString(), name: 'fetchNews error');
  //   }
  // }

  // fetchElectedOfficials() async {
  //   try {
  //     await ApiService()
  //         .getElectedOfficials()
  //         .then((value) => {electedOfficialsModel = value});
  //   } on Exception catch (e) {
  //     log(e.toString(), name: 'fetch elected officials error');
  //   }
  //   update();
  // }

  // fetchSuchanaAdhikari() async {
  //   try {
  //     await ApiService().getSuchanaAdhikari().then(
  //           (value) => {
  //             if (value != null)
  //               {suchanaAdhikariModel = SuchanaAdhikariModel.fromJson(value)},
  //           },
  //         );
  //     update();
  //   } on Exception catch (e) {
  //     log(e.toString(), name: 'fetch suchana adhikari error');
  //   }
  // }
}
  // getDocumentNotice() async {
  //   try {
  //     await ApiService().getDocumentNotice().then(
  //           (value) => {
  //             if (value != null)
  //               {noticeHeadingModel = DoucmentNoticeModel.fromJson(value)},
  //           },
  //         );
  //     update();
  //   } on Exception catch (e) {
  //     log(e.toString(), name: 'fetch document Notice error');
  //   }
  // }
// }
