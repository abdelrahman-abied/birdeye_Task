import 'package:birdeye_task/shared/album_item.dart';
import 'package:birdeye_task/shared/internet_off.dart';
import 'package:birdeye_task/view/user_image.dart';
import 'package:birdeye_task/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  static const String route = "home";
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    Provider.of<HomeVM>(context, listen: false)
      ..checkInternetConnected()
      ..getAllAlbum();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeVM = Provider.of<HomeVM>(context);
    return homeVM.isInternetConnected
        ? Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, UserImageView.route);
                  },
                  icon: const Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            body: SafeArea(
              child: ListView.builder(
                itemCount: homeVM.albums.length,
                itemBuilder: (BuildContext context, int index) {
                  final album = homeVM.albums[index];
                  return AlbumItem(album: album);
                },
              ),
            ),
          )
        : NoInternet();
  }
}
