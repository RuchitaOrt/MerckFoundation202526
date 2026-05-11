import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/model/EpisodeInfoResponse.dart';

import 'package:merckfoundation_252026/model/EpisodeSeasonResponse.dart';

import '../Service/EpisodeService.dart';


class EpisodeProvider extends ChangeNotifier {
  final EpisodeService _service = EpisodeService();

  bool isLoading = false;

  List<EpisodeSeason> seasons = [];

  Future<void> getEpisodes(
    BuildContext context,
  ) async {
    try {
      isLoading = true;
      notifyListeners();

      final response =
          await _service.fetchEpisodes(context);

      seasons = response.data;
    } catch (e) {
      debugPrint("EPISODE ERROR : $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }



  EpisodeInfo? episodeInfo;

  Future<void> getEpisodeInfo(
    BuildContext context,
    int episodeId,
  ) async {
    try {
      isLoading = true;
      notifyListeners();

      final response = await _service.fetchEpisodeInfo(context, episodeId);

      episodeInfo = response.data;
    } catch (e) {
      debugPrint("EPISODE INFO ERROR: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }




  
}