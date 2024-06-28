import 'dart:convert';

import 'package:flutter/services.dart';

Future<Map<String, dynamic>> loadJsonFromAssets(String filePath) async {
  String jsonString = await rootBundle.loadString(filePath);
  return jsonDecode(jsonString);
}

final class LaunchJsonClass {
  final String apiKeyId;
  final String someConditionsPath;
  final bool isStage;
  final bool isProd;

  const LaunchJsonClass({
    required this.apiKeyId,
    required this.someConditionsPath,
    required this.isStage,
    required this.isProd,
  });

  factory LaunchJsonClass.fromJson(Map<String, dynamic> json) =>
      LaunchJsonClass(
        apiKeyId: json["API_KEY_ID"],
        someConditionsPath: json["SOME_CONDITIONS_PATH"],
        isStage: json["IS_STAGE"],
        isProd: json["IS_PROD"],
      );

  Map<String, dynamic> toJson() => {
        "API_KEY_ID": apiKeyId,
        "SOME_CONDITIONS_PATH": someConditionsPath,
        "IS_STAGE": isStage,
        "IS_PROD": isProd,
      };
}
