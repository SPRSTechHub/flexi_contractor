// To parse this JSON data, do
//
//     final sitedata = sitedataFromJson(jsonString);

import 'dart:convert';

List<Sitedata> sitedataFromJson(String str) =>
    List<Sitedata>.from(json.decode(str).map((x) => Sitedata.fromJson(x)));

String sitedataToJson(List<Sitedata> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Sitedata {
  Sitedata({required this.siteCode, required this.siteName});

  String siteCode;
  String siteName;

  factory Sitedata.fromJson(Map<String, dynamic> json) =>
      Sitedata(siteCode: json["site_code"], siteName: json["site_name"]);

  Map<String, dynamic> toJson() =>
      {"site_code": siteCode, "site_name": siteName};
}

List<Buildingsdata> buildingsdataFromJson(String str) =>
    List<Buildingsdata>.from(
        json.decode(str).map((x) => Buildingsdata.fromJson(x)));

String buildingsdataToJson(List<Buildingsdata> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Buildingsdata {
  Buildingsdata({
    required this.buildingCode,
    required this.buildingName,
  });

  String buildingCode;
  String buildingName;

  factory Buildingsdata.fromJson(Map<String, dynamic> json) => Buildingsdata(
        buildingCode: json["building_code"],
        buildingName: json["building_name"],
      );

  Map<String, dynamic> toJson() => {
        "building_code": buildingCode,
        "building_name": buildingName,
      };
}
