// import 'package:flutter/material.dart';
// import 'package:merckfoundation_252026/Utility/APIManager.dart';
// import 'package:merckfoundation_252026/model/EpisodeInfoResponse.dart';
// import 'package:merckfoundation_252026/model/EpisodeSeasonResponse.dart';



// class EpisodeService {
//   final APIManager _apiManager = APIManager();

//   Future<EpisodeSeasonResponse> fetchEpisodes(
//     BuildContext context,
//   ) async {
//     final response = await _apiManager.apiRequest(
//       context,
//       API.homeseasonlist,
//     );

//     return EpisodeSeasonResponse.fromJson(response);
//   }

   

//   Future<EpisodeInfoResponse> fetchEpisodeInfo(
//     BuildContext context,
//     int episodeId,
//   ) async {
//     final response = await _apiManager.apiRequest(
//       context,
//       API.getepisodeinfo,
//       jsonval: {
//         "episode_id":episodeId.toString()
//       }
//     );

//     return EpisodeInfoResponse.fromJson(response);
//   }
// }

import 'package:flutter/material.dart';

import 'package:merckfoundation_252026/Utility/APIManager.dart';
import 'package:merckfoundation_252026/Utility/api_result.dart';

import 'package:merckfoundation_252026/model/EpisodeInfoResponse.dart';
import 'package:merckfoundation_252026/model/EpisodeSeasonResponse.dart';

class EpisodeService {

  final APIManager _apiManager =
      APIManager();

  /// =========================
  /// EPISODE LIST
  /// =========================

  Future<ApiResult<List<EpisodeSeason>>>
      fetchEpisodes(
    BuildContext context,
  ) async {

    final result =
        await _apiManager.apiRequest(
      context,
      API.homeseasonlist,
    );

    /// API FAILED
    if (!result.isSuccess) {

      return ApiResult(
        status: result.status,
        message: result.message,
      );
    }

    /// PARSE RESPONSE
    final response =
        EpisodeSeasonResponse.fromJson(
      result.data,
    );

    return ApiResult(
      status: result.status,
      data: response.data,
    );
  }

  /// =========================
  /// EPISODE INFO
  /// =========================

  Future<ApiResult<EpisodeInfo>>
      fetchEpisodeInfo(
    BuildContext context,
    String episodeId,
  ) async {
print("episode_id ${episodeId}");
    final result =
        await _apiManager.apiRequest(
      context,
      API.getepisodeinfo,
      jsonval: {
        "episode_id":
        episodeId
            // int.parse(episodeId.toString()),
      },
    );

    /// API FAILED
    if (!result.isSuccess) {

      return ApiResult(
        status: result.status,
        message: result.message,
      );
    }

    /// PARSE RESPONSE
    final response =
        EpisodeInfoResponse.fromJson(
      result.data,
    );

    return ApiResult(
      status: result.status,
      data: response.data,
    );
  }
}