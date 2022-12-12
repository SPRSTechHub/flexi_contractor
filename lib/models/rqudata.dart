// To parse this JSON data, do
//
//     final rqForm = rqFormFromMap(jsonString);
import 'dart:convert';

List<RqForm> rqFormFromJson(String str) =>
    List<RqForm>.from(json.decode(str).map((x) => RqForm.fromJson(x)));

String rqFormToJson(List<RqForm> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RqForm {
  RqForm({
    required this.itemCode,
    required this.itemName,
    required this.itemSize,
    required this.itemType,
    required this.itemMin,
  });

  String itemCode;
  String itemName;
  String itemSize;
  String itemType;
  int itemMin;

  factory RqForm.fromJson(Map<String, dynamic> json) => RqForm(
        itemCode: json["item_code"],
        itemName: json["item_name"],
        itemSize: json["item_size"],
        itemType: json["item_type"],
        itemMin: json["item_min"],
      );

  Map<String, dynamic> toJson() => {
        "item_code": itemCode,
        "item_name": itemName,
        "item_size": itemSize,
        "item_type": itemType,
        "item_min": itemMin,
      };
}
