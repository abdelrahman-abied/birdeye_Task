// To parse this JSON data, do
//
//     final albumPhoto = albumPhotoFromMap(jsonString);

import 'dart:convert';

List<AlbumPhoto> albumPhotoFromMap(String str) =>
    List<AlbumPhoto>.from(json.decode(str).map((x) => AlbumPhoto.fromMap(x)));

String albumPhotoToMap(List<AlbumPhoto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class AlbumPhoto {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  AlbumPhoto({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  AlbumPhoto.fromMap(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['albumId'] = this.albumId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['thumbnailUrl'] = this.thumbnailUrl;
    return data;
  }
}
