import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

mixin AppColor {
  static const primaryClr = Color(0xff004e9e);
  static const red = Color.fromRGBO(238, 29, 37, 1);
  static const backgroundClr = Color.fromRGBO(250, 250, 250, 1);
  static const mainClr = Color.fromRGBO(15, 39, 115, 1);
}

mixin AppIcons {
  static const youtube = 'assets/youtube.png';
  static const homeIcons = 'assets/homeIcons.png';
  static const facebook = 'assets/facebook.png';
  static const map = 'assets/map.png';
  static const canteen = 'assets/icons/canteen.svg';
  static const gas = 'assets/icons/gas.svg';
  static const inventory = 'assets/icons/inventory.svg';
  static const sms = 'assets/icons/sms.svg';
  static const splashLogo = 'assets/splash_logo.png';
  static const fb = 'assets/icons/fb.svg';
  static const home = 'assets/icons/home.svg';
  static const nepalPolice = 'assets/icons/nepal_police.svg';
  static const checklist = 'assets/icons/checklist.svg';
  static const calender = 'assets/icons/calendar.svg';
  static const rajaswa = 'assets/icons/Rajaswa.svg';
  static const suggestion = 'assets/icons/suggestion.svg';
  static const nagarpalik = 'assets/icons/nagarpalika_Stats.svg';
  static const logo = 'assets/logo.png';
  static const nationallogo = 'assets/splash_logo.png';
  static const people = 'assets/icons/People.svg';
  static const ambulance = 'assets/icons/ambulance.svg';
  static const law = 'assets/icons/Law.svg';
  static const news = 'assets/icons/News.svg';
  static const wardReport = 'assets/icons/Ward Report.svg';
  static const departments = 'assets/icons/Departments.svg';
  static const agriculture = 'assets/icons/Agriculture.svg';
  static const certificate = 'assets/icons/certificate.svg';
  static const commitee = 'assets/icons/Commitee.svg';
  static const contact = 'assets/icons/Contact.svg';
  static const importantLinks = 'assets/icons/Important_Links.svg';
  static const onlineLinks = 'assets/icons/Online_links.svg';
  static const revenue = 'assets/icons/revenue.svg';
  static const socialProtection = 'assets/icons/Social_Protection.svg';
  static const vendor = 'assets/icons/Vendor.svg';
  static const workerReport = 'assets/icons/Worker_Report.svg';
  static const hakiri = 'assets/icons/hajiri.svg';
  static const tax = 'assets/icons/tax.svg';

  //Quick link icons
  static const shikshya = 'assets/icons/shikshya.svg';
  static const pasusewa = 'assets/icons/pasusewa.svg';
  static const khelkud = 'assets/icons/khelkud.svg';
  static const kanun = 'assets/icons/kanun.svg';
  static const karmachari = 'assets/icons/karmachari.svg';
  static const swasthya = 'assets/icons/swasthya.svg';
  static const sahakari = 'assets/icons/Sahakari.svg';
  static const padhakari = 'assets/icons/padhakari.svg';
}

TextStyle get titleStyle {
  return TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
}

TextStyle get subtitleStyle {
  return TextStyle(
      fontSize: 15.sp, fontWeight: FontWeight.w400, color: Colors.black);
}

buildsizedbox() {
  return SizedBox(
    height: 3.5.h,
  );
}
