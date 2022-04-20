import 'package:birdeye_task/model/data_model/album.dart';
import 'package:birdeye_task/view/album_details.dart';
import 'package:flutter/material.dart';

class AlbumItem extends StatelessWidget {
  final Album album;
  const AlbumItem({Key? key, required this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AlbumDetailsView(
                  id: album.id.toString(),
                ),
              ));
        },
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: Colors.black45,
                shape: BoxShape.circle,
              ),
              child: Text(
                album.id.toString(),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Text(
                album.title.toString(),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
