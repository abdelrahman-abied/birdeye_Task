import 'package:birdeye_task/view_model/details_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlbumDetailsView extends StatefulWidget {
  static const String route = "album_details";
  AlbumDetailsView({Key? key, this.id}) : super(key: key);
  final String? id;
  @override
  State<AlbumDetailsView> createState() => _AlbumDetailsViewState();
}

class _AlbumDetailsViewState extends State<AlbumDetailsView> {
  @override
  void initState() {
    Provider.of<DetailsVM>(context, listen: false).getAlbumDetails(widget.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final detailsVM = Provider.of<DetailsVM>(context);
    return Scaffold(
      appBar: AppBar(title: Text(widget.id.toString())),
      body: SafeArea(
        child: detailsVM.albumDetails.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: detailsVM.albumDetails.length,
                itemBuilder: (BuildContext context, int index) {
                  final albumDetails = detailsVM.albumDetails[index];
                  return Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(5),
                        child: CachedNetworkImage(
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          imageUrl: albumDetails.url.toString(),
                        ),
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }
}
