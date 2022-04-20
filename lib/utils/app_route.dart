import 'package:birdeye_task/view/album_details.dart';
import 'package:birdeye_task/view/home_view.dart';
import 'package:birdeye_task/view/user_image.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> appRoutes(context) {
  return {
    '/': (context) => HomeView(),
    AlbumDetailsView.route: (context) => AlbumDetailsView(),
    UserImageView.route: (context) => UserImageView(),
  };
}
