import 'package:birdeye_task/model/data/remote/album_service.dart';
import 'package:birdeye_task/model/data_model/album_photo.dart';
import 'package:flutter/foundation.dart';

class DetailsVM extends ChangeNotifier {
  List<AlbumPhoto> albumDetails = [];
  Future getAlbumDetails(String albumId) async {
    albumDetails.clear();
    albumDetails = await getAlbumDetailsService(albumId);
    notifyListeners();
  }
}
