import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:gandakimun/screens/login/model/login_send_model.dart';

class HrmApi {
  // var base = "https://api.suryodayamun.org/api/";
  var base = "https://demoapi.suryodayamun.org/api/";

  Future login(LoginDataModel loginmodel) async {
    try {
      var headers = {"Content-Type": "application/json"};
      var url = Uri.parse('${base}token');
      var response =
          await http.post(url, headers: headers, body: jsonEncode(loginmodel));
      var data = jsonDecode(response.body);
      log(jsonEncode(loginmodel), name: 'login data');

      if (response.statusCode == 200) {
        return data;
      }
    } on Exception catch (e) {
      log(e.toString(), name: 'Login error');
    }
  }

  Future leaveTypes(token) async {
    try {
      var headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      };
      var response =
          await http.get(Uri.parse('${base}leavetype'), headers: headers);
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return data;
      }
    } on Exception catch (e) {
      log(e.toString(), name: 'leaveTypes error');
    }
  }

  Future getRecommender(token) async {
    try {
      var headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      };
      var response =
          await http.get(Uri.parse('${base}recommender'), headers: headers);
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return data;
      }
    } on Exception catch (e) {
      log(e.toString(), name: 'getRecommender error');
    }
  }

  Future getVisitArea(token) async {
    try {
      var headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      };
      var response =
          await http.get(Uri.parse('${base}visitarea'), headers: headers);
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return data;
      }
    } on Exception catch (e) {
      log(e.toString(), name: 'getVisitArea error');
    }
  }

  Future getVisitType(token) async {
    try {
      var headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      };
      var response =
          await http.get(Uri.parse('${base}visittype'), headers: headers);
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return data;
      }
    } on Exception catch (e) {
      log(e.toString(), name: 'getVisitType error');
    }
  }

  Future getVisitVehicle(token) async {
    try {
      var headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      };
      var response =
          await http.get(Uri.parse('${base}visitvehicle'), headers: headers);
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return data;
      }
    } on Exception catch (e) {
      log(e.toString(), name: 'getVisitVehicle error');
    }
  }

  Future applyLeave(token, body) async {
    try {
      var headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      };
      var response = await http.post(Uri.parse('${base}leave'),
          headers: headers, body: jsonEncode(body));
      var data = jsonDecode(response.body);
      return data;
    } on Exception catch (e) {
      log(e.toString(), name: 'applyLeave error');
    }
  }

  Future getLeave(token) async {
    try {
      var headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      };
      var response =
          await http.get(Uri.parse('${base}leave'), headers: headers);
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return data;
      }
    } on Exception catch (e) {
      log(e.toString(), name: 'getLeave error');
    }
  }

  Future getVisit(token) async {
    try {
      var headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      };
      var response =
          await http.get(Uri.parse('${base}visit'), headers: headers);
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return data;
      }
    } on Exception catch (e) {
      log(e.toString(), name: 'getVisit error');
    }
  }

  Future getFieldVisit(token) async {
    try {
      var headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      };
      var response =
          await http.get(Uri.parse('${base}field'), headers: headers);
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return data;
      }
    } on Exception catch (e) {
      log(e.toString(), name: 'getFieldVisit error');
    }
  }

  Future getProfile(token) async {
    try {
      var headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      };
      var response =
          await http.get(Uri.parse('${base}profile'), headers: headers);
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return data;
      }
    } on Exception catch (e) {
      log(e.toString(), name: 'getProfile error');
    }
  }

  Future applyVisit(token, body) async {
    try {
      var headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      };
      var response = await http.post(Uri.parse('${base}visit'),
          headers: headers, body: jsonEncode(body));
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return data;
      }
    } on Exception catch (e) {
      log(e.toString(), name: 'applyVisit');
    }
  }

  Future applyFieldVisit(token, body) async {
    try {
      var headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      };
      var response = await http.post(Uri.parse('${base}field'),
          headers: headers, body: jsonEncode(body));
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return data;
      }
    } on Exception catch (e) {
      log(e.toString(), name: 'applyFieldVisit error');
    }
  }
}
