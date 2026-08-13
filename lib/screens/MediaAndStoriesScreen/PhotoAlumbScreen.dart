import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ApiStatusHandler.dart';
import 'package:merckfoundation_252026/Utility/api_status.dart';
import 'package:merckfoundation_252026/screens/MediaAndStoriesScreen/MediaListingScreen.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonLoader.dart';

import 'package:merckfoundation_252026/widgets/EmptyStateWidget.dart';
import 'package:provider/provider.dart';

import 'package:merckfoundation_252026/Provider/PhotoAlbumProvider.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/customappbar.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/widgets/CommonList/HorizontalAlbumWidget.dart';

class PhotoAlumbScreen extends StatefulWidget {
  final String? pageTile;
  final String? tile;
  final String? categoryID;
   final String menuID;

  final String? shareLink;

  const PhotoAlumbScreen({
    super.key,
    this.tile,
    this.categoryID,
    this.pageTile, required this.menuID, this.shareLink,
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
        title: "${widget.tile} Photo Gallery" ,
        onSearch: () {},
        shareLink: widget.shareLink ?? "",
        menuID: widget.menuID,
        onBack: ()
        {
           Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MediaListingScreen(
              type: MediaType.photoGallery,
              categoryID: "",
              albumID: "",
              albumName: "",
              menuID: widget.menuID,
              shareLink: widget.shareLink,
              title: MediaType.photoGallery.name ?? "",
            ),
          ),
        );
          // Navigator.pop(context);
        },
      ),
     body: provider.isLoading
    ? const Center(
        child: CommonLoader(),
      )

    :   (provider.status != ApiStatus.success &&
            provider.status != ApiStatus.initial)
        ? ApiStatusHandler(
            status: provider.status,
            errorMessage: provider.errorMessage,
            onRetry: () {
              provider.retry(
                context,
                widget.categoryID!,
              );
            },
          )

        : provider.albums.isEmpty
                    ? const Center(
                        child:
                            EmptyStateWidget(),
                      )

                    : ListView.builder(
                        padding:
                            const EdgeInsets.only(
                          bottom: 20,
                        ),
                        itemCount:
                            provider.albums.length,
                        itemBuilder:
                            (context, index) {

                          final album =
                              provider
                                  .albums[index];

                          if (album
                              .imagelist
                              .isEmpty) {
                            return const SizedBox();
                          }

                          return HorizontalAlbumWidget(
                            title:
                                album.albumName,
                            images:
                                album.imagelist,
                            imageUrl:
                                (item) =>
                                    item.photo,
                            alubumID:
                                album.id
                                    .toString(),
                            alubumName:
                                album.albumName,
                            categoryID:
                                widget.categoryID
                                    .toString(),
                            menuID:
                                widget.menuID,
                            shareLink:
                                widget.shareLink,
                          );
                        },
                      ),
      
    );
  }
}
