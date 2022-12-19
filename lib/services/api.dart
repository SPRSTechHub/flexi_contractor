import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/rqudata.dart';
import '../models/sitedata.dart';

class RemoteApiService {
  static var client = http.Client();
  static var url = 'https://sprs.shop/api/';
  static Map<String, String> headers = {
    "Content-type": "application/x-www-form-urlencoded",
    'Accept': 'application/json',
  };

  static Future<List<Sitedata>?> fetchSiteLists(
      String action, String userid) async {
    var postData = {'apiKey': 'sprs', 'action': action, 'userid': userid};

    final response =
        await http.post(Uri.parse(url), headers: headers, body: postData);

    if (response.statusCode == 200) {
      var resp = json.decode(response.body);
      if (resp['status'] == 0) {
        var jsonString = jsonEncode(resp['data']);
        return sitedataFromJson(jsonString);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<List<Buildingsdata>?> fetchBuildings(
      String action, String sitecode) async {
    var postData = {'apiKey': 'sprs', 'action': action, 'sitecode': sitecode};

    final response =
        await http.post(Uri.parse(url), headers: headers, body: postData);

    if (response.statusCode == 200) {
      var resp = json.decode(response.body);
      if (resp['status'] == 0) {
        var jsonString = jsonEncode(resp['data']);
        //print(buildingsdataFromJson(jsonString));
        return buildingsdataFromJson(jsonString);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<List<RqForm>?> fetchForm(
      String action, String task_code) async {
    var postData = {'apiKey': 'sprs', 'action': action, 'task_code': task_code};

    final response =
        await http.post(Uri.parse(url), headers: headers, body: postData);

    if (response.statusCode == 200) {
      var resp = json.decode(response.body);
      if (resp['status'] == 0) {
        var jsonString = jsonEncode(resp['data']);
        //print(buildingsdataFromJson(jsonString));
        return rqFormFromJson(jsonString);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<dynamic> submitRequisitionForm(String? itemData) async {
    var jsonBody = {
      'action': 'add_requitions',
      'enq_list_items': itemData,
    };

    final response =
        await http.post(Uri.parse(url), headers: headers, body: jsonBody);

    print(response.body);

    /*  if (response.statusCode == 200) {
      print(response.body);
      var resp = json.decode(response.body);
      if (resp['status'] == 0) {
        var jsonString = jsonEncode(resp['data']);

        return true;
      } else {
        return false;
      }
    } else {
      throw Exception('Failed to submit data.');
    } */
  }
}
