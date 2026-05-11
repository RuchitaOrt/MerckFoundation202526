import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:merckfoundation_252026/Provider/PhotoAlbumProvider.dart';
import 'package:merckfoundation_252026/Utility/customappbar.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/widgets/HorizontalAlbumWidget.dart';

class PhotoAlumbScreen extends StatefulWidget {
  final String? pageTile;
  final String? tile;
  final String? categoryID;

  const PhotoAlumbScreen({
    super.key,
    this.tile,
    this.categoryID,
    this.pageTile,
  });

  @override
  State<PhotoAlumbScreen> createState() => _PhotoAlumbScreenPageState();
}

class _PhotoAlumbScreenPageState extends State<PhotoAlumbScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PhotoAlbumProvider>().getPhotoAlbums(
        context,
        widget.categoryID!,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PhotoAlbumProvider>();

    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: CommonAppBar(
        type: AppBarType.inner,
        title: "${widget.tile} ${widget.pageTile}" ?? "",
        onSearch: () {},
        onShare: () {},
      ),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : provider.albums.isEmpty
          ? const Center(child: Text("No Albums Found"))
          : ListView.builder(
              padding: const EdgeInsets.only(bottom: 20),
              itemCount: provider.albums.length,
              itemBuilder: (context, index) {
                final album = provider.albums[index];

                if (album.imagelist.isEmpty) {
                  return const SizedBox();
                }

                return HorizontalAlbumWidget(
                  title: album.albumName,
                  images: album.imagelist,
                  imageUrl: (item) => item.photo,
                  alubumID: album.id.toString(),
                  alubumName: album.albumName,
                  categoryID: widget.categoryID.toString(),
                );
              },
            ),
    );
  }
}
