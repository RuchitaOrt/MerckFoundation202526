// import 'package:flutter/material.dart';
// import 'package:merckfoundation_252026/model/EpisodeInfoResponse.dart';

// import 'package:merckfoundation_252026/model/EpisodeSeasonResponse.dart';

// import '../Service/EpisodeService.dart';


// class EpisodeProvider extends ChangeNotifier {
//   final EpisodeService _service = EpisodeService();

//   bool isLoading = false;

//   List<EpisodeSeason> seasons = [];

//   Future<void> getEpisodes(
//     BuildContext context,
//   ) async {
//     try {
//       isLoading = true;
//       notifyListeners();

//       final response =
//           await _service.fetchEpisodes(context);

//       seasons = response.data;
//     } catch (e) {
//       debugPrint("EPISODE ERROR : $e");
//     } finally {
//       isLoading = false;
//       notifyListeners();
//     }
//   }



//   EpisodeInfo? episodeInfo;

//   Future<void> getEpisodeInfo(
//     BuildContext context,
//     int episodeId,
//   ) async {
//     try {
//       isLoading = true;
//       notifyListeners();

//       final response = await _service.fetchEpisodeInfo(context, episodeId);

//       episodeInfo = response.data;
//     } catch (e) {
//       debugPrint("EPISODE INFO ERROR: $e");
//     } finally {
//       isLoading = false;
//       notifyListeners();
//     }
//   }




  
// }

import 'package:flutter/material.dart';

import 'package:merckfoundation_252026/Utility/api_status.dart';

import 'package:merckfoundation_252026/model/EpisodeInfoResponse.dart';
import 'package:merckfoundation_252026/model/EpisodeSeasonResponse.dart';

import '../Service/EpisodeService.dart';

class EpisodeProvider
    extends ChangeNotifier {

  final EpisodeService _service =
      EpisodeService();

  /// =========================
  /// STATUS
  /// =========================

  ApiStatus status =
      ApiStatus.initial;

  ApiStatus infoStatus =
      ApiStatus.initial;

  String errorMessage = "";

  bool isLoading = false;

  /// =========================
  /// SEASONS
  /// =========================

  List<EpisodeSeason> seasons = [];

  /// =========================
  /// EPISODE INFO
  /// =========================

  EpisodeInfo? episodeInfo;

  /// =========================
  /// GET EPISODES
  /// =========================

  Future<void> getEpisodes(
    BuildContext context,
  ) async {

    isLoading = true;

    status = ApiStatus.loading;

    notifyListeners();

    final result =
        await _service.fetchEpisodes(
      context,
    );

    status = result.status;

    if (result.isSuccess) {

      seasons = result.data ?? [];

    } else {

      errorMessage =
          result.message ?? "";
    }

    isLoading = false;

    notifyListeners();
  }

  /// =========================
  /// GET EPISODE INFO
  /// =========================

  Future<void> getEpisodeInfo(
    BuildContext context,
    int episodeId,
  ) async {

    isLoading = true;

    infoStatus = ApiStatus.loading;

    notifyListeners();

    final result =
        await _service.fetchEpisodeInfo(
      context,
      episodeId,
    );

    infoStatus = result.status;

    if (result.isSuccess) {

      episodeInfo = result.data;

    } else {

      errorMessage =
          result.message ?? "";
    }

    isLoading = false;

    notifyListeners();
  }

  /// =========================
  /// RETRY
  /// =========================

  Future<void> retryEpisodes(
    BuildContext context,
  ) async {

    await getEpisodes(context);
  }

  Future<void> retryEpisodeInfo(
    BuildContext context,
    int episodeId,
  ) async {

    await getEpisodeInfo(
      context,
      episodeId,
    );
  }
}