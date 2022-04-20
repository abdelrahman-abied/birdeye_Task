// To parse this JSON data, do
//
//     final album = albumFromMap(jsonString);

import 'dart:convert';

List<Album> albumFromMap(String str) =>
    List<Album>.from(json.decode(str).map((x) => Album.fromMap(x)));

String albumToMap(List<Album> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Album {
  int? userId;
  int? id;
  String? title;

  Album({this.userId, this.id, this.title});

  Album.fromMap(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}
