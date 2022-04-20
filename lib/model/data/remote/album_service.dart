import 'package:birdeye_task/constants/constants.dart';
import 'package:birdeye_task/model/data_model/album.dart';
import 'package:birdeye_task/model/data_model/album_photo.dart';
import 'package:http/http.dart' as http;

Future<List<Album>> getAllAlbumService() async {
  try {
    final response = await http.get(Uri.parse(Constants.baseUrl + "albums"));

    if (response.statusCode == 200) {
      return albumFromMap(response.body);
    } else {
      return [];
    }
  } catch (e) {
    return [];
  }
}

Future<List<AlbumPhoto>> getAlbumDetailsService(String albumId) async {
  try {
    final response =
        await http.get(Uri.parse(Constants.baseUrl + "albums/$albumId/photos"));

    if (response.statusCode == 200) {
      return albumPhotoFromMap(response.body);
    } else {
      return [];
    }
  } catch (e) {
    return [];
  }
}
