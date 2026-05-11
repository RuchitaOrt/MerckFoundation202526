import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/APIManager.dart';
import 'package:merckfoundation_252026/model/EpisodeInfoResponse.dart';
import 'package:merckfoundation_252026/model/EpisodeSeasonResponse.dart';



class EpisodeService {
  final APIManager _apiManager = APIManager();

  Future<EpisodeSeasonResponse> fetchEpisodes(
    BuildContext context,
  ) async {
    final response = await _apiManager.apiRequest(
      context,
      API.homeseasonlist,
    );

    return EpisodeSeasonResponse.fromJson(response);
  }

   

  Future<EpisodeInfoResponse> fetchEpisodeInfo(
    BuildContext context,
    int episodeId,
  ) async {
    final response = await _apiManager.apiRequest(
      context,
      API.getepisodeinfo,
      jsonval: {
        "episode_id":episodeId.toString()
      }
    );

    return EpisodeInfoResponse.fromJson(response);
  }
}