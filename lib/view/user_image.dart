import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImageView extends StatefulWidget {
  static const String route = "user_image";

  UserImageView({Key? key}) : super(key: key);

  @override
  _UserImageViewState createState() => _UserImageViewState();
}

class _UserImageViewState extends State<UserImageView> {
  var checkActive = false;
  var isLoading = false;
  File? _image;
  final picker = ImagePicker();

  Future getImageGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {}
    });
  }

  @override
  void initState() {
    super.initState();
  }

  Future getImageCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {}
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(5.0),
        margin: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    alignment: Alignment.center,
                    child: ListTile(
                      onTap: () {
                        showSheetGallery(context);
                      },
                      title: const Text(
                        "Pick Image",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      trailing: const Icon(
                        Icons.image,
                        size: 50,
                      ),
                      leading: const Icon(
                        Icons.upload,
                        size: 30,
                      ),
                    ),
                  ),
                  Container(
                    // alignment: Alignment.center,
                    child: (_image == null)
                        ? const Center(
                            child: Text(
                              'Image',
                            ),
                          )
                        : Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image: FileImage(
                                  _image!,
                                ),
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showSheetGallery(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text("Gallery"),
                onTap: () {
                  getImageGallery();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text("Camera"),
                onTap: () {
                  getImageCamera();
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}
