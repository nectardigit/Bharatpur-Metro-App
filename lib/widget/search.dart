import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/screens/dashboard_screens/public_services_page/education_screen.dart';
import 'package:gandakimun/screens/other/news_screen.dart';
import 'package:gandakimun/widget/webview_widget.dart';

import '../constants.dart';
import '../controllers/appcontroller.dart';
import '../screens/other/details_of_ward.dart';
import '../screens/dashboard_screens/urgent_contact_no_page/essential_contacts.dart';
import '../screens/dashboard_screens/important_links_page/important_links.dart';
import '../screens/other/introduction_screen.dart';
import '../screens/quick_link_screens/elected_officials_screen.dart';
import '../screens/quick_link_screens/health_screen.dart';
import '../screens/quick_link_screens/law_screen.dart';
import '../screens/quick_link_screens/sport_screen.dart';

final controller = Get.put(AppController());

class MySearchDelegate extends SearchDelegate {
  List<String> showresults = [
    "hajiri",
    "taxpayer portal",
    "our introduction",
    "Details of ward",
    "Laws",
    "Employee Details",
    "Contacts",
    "Links",
    "Elected officials",
    "Education",
    "Animal service",
    "Sports",
    "Health",
    "News"
  ];
  List<Widget> routes = [
    WebviewWidget(
        title: controller.isNepali.value ? 'हाजिरी' : "Hajiri",
        url: 'https://hrm.suryodayamun.org'),
    WebviewWidget(
        url: 'https://tax.suryodayamun.org',
        title: controller.isNepali.value ? 'करदाता पोर्टल' : "Taxpayer Portal"),
    IntroductionScreen(),
    DetailsOfWard(),
    // LawScreen(),
    EssentialContacts(),
    ImportantLinkScreen(),
    ElectedOfficialsScreen(),
    EducationScreen(),
    SportScreen(),
    HealthScreen(),
    NewsScreen()
  ];
  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
        // colo
        appBarTheme: const AppBarTheme(backgroundColor: AppColor.primaryClr),
        scaffoldBackgroundColor: Colors.white,
        hintColor: Colors.white,
        textTheme: const TextTheme(
            titleLarge: TextStyle(
                // headline 6 affects the query text
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.bold)),

    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query.isEmpty) {
                close(context, null);
              } else {
                query = '';
              }
            },
            icon: const Icon(Icons.clear))
      ];

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back_ios_new_outlined));
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = showresults.where((showresult) {
      final result = showresult.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();
    return SingleChildScrollView(
      child: Column(
        children: [
          ...List.generate(
              suggestions.length,
              (index) => ListTile(
                    title: Text(
                      suggestions[index],
                      style: subtitleStyle,
                    ),
                    onTap: () {
                      query = suggestions[index];
                      Get.to(() => routes[index]);
                    },
                  ))
        ],
      ),
    );
  }
}
