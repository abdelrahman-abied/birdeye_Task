import 'package:birdeye_task/model/data/remote/album_service.dart';
import 'package:birdeye_task/model/data_model/album.dart';
import 'package:birdeye_task/utils/componenets.dart';
import 'package:flutter/foundation.dart';

class HomeVM extends ChangeNotifier {
  List<Album> _albums = [];
  bool _isInternetConnected = false;
  Future getAllAlbum() async {
    _albums = await getAllAlbumService();
    notifyListeners();
  }

  Future checkInternetConnected() async {
    _isInternetConnected = await checkConnection();
    notifyListeners();
  }

  List<Album> get albums => _albums;
  bool get isInternetConnected => _isInternetConnected;
}
