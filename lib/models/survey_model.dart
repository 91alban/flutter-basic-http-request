import 'dart:convert';

import 'package:flutter/cupertino.dart';

// Survey imgFromJson(String str) => Survey.fromJson(json.decode(str));
// String imgToJson(Survey data) => json.encode(data.toJson());

// class Survey {
//   final String id;
//   final String title;

//   const Survey({
//     required this.id,
//     required this.title,
//   });

//   factory Survey.fromJson(Map<String, dynamic> json) {
//     return Survey(
//       id: json['id'],
//       title: json['title'],
//     );
//   }
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//       };
// }

class Survey {
  final String id;
  final String title;

  Survey({
    required this.id,
    required this.title,
  });

  static Survey fromJson(json) => Survey(
        id: json['id'],
        title: json['title'],
      );

  // Survey.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   title = json['title'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['id'] = id;
  //   data['title'] = title;

  //   return data;
  // }
}
