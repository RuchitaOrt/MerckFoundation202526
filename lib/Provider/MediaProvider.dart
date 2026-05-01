import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/model/MediaModel.dart';
import 'package:merckfoundation_252026/service/MediaService.dart';
class MediaProvider extends ChangeNotifier {
  final MediaService _service = MediaService();

  List<MediaModel> mediaList = [];
  int currentPage = 1;
  bool isLoading = false;
  bool hasMore = true;

  Future<void> loadInitial(BuildContext context) async {
    if (isLoading) return;

    isLoading = true;
    notifyListeners();

    final response = await _service.fetchMedia(context, 1);

    mediaList = (response['data'] as List)
        .map((e) => MediaModel.fromJson(e))
        .toList();

    currentPage = 1;
    hasMore = response['next'] != null;

    isLoading = false;
    notifyListeners();
  }

  Future<void> loadMore(BuildContext context) async {
    if (!hasMore || isLoading) return;

    isLoading = true;
    notifyListeners();

    final nextPage = currentPage + 1;

    final response = await _service.fetchMedia(context, nextPage);

    final newList = (response['data'] as List)
        .map((e) => MediaModel.fromJson(e))
        .toList();

    mediaList.addAll(newList);
    currentPage = nextPage;
    hasMore = response['next'] != null;

    isLoading = false;
    notifyListeners();
  }
}