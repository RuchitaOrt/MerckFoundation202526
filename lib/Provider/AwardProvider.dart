// import 'package:flutter/material.dart';
// import 'package:merckfoundation_252026/model/AwardResponse.dart';


// import '../service/AwardService.dart';

// class AwardProvider extends ChangeNotifier {
//   final AwardService _service = AwardService();

//   bool isLoading = false;

//   List<AwardModel> awardList = [];

//   Future<void> getAwards() async {
//     try {
//       isLoading = true;
//       notifyListeners();

//       awardList = await _service.fetchAward();

//     } catch (e) {
//       debugPrint(e.toString());
//     } finally {
//       isLoading = false;
//       notifyListeners();
//     }
//   }
// }
import 'package:flutter/material.dart';

import 'package:merckfoundation_252026/Utility/api_status.dart';

import 'package:merckfoundation_252026/model/AwardResponse.dart';

import 'package:merckfoundation_252026/service/AwardService.dart';

class AwardProvider
    extends ChangeNotifier {

  final AwardService _service =
      AwardService();

  ApiStatus status =
      ApiStatus.initial;

  String errorMessage = "";

  bool isLoading = false;

  List<AwardModel> awardList = [];

  /// =========================
  /// LOAD AWARDS
  /// =========================

  Future<void> getAwards(
    BuildContext context,
  ) async {

    isLoading = true;

    status = ApiStatus.loading;

    notifyListeners();

    final result =
        await _service.fetchAward(
      context,
    );

    status = result.status;

    if (result.isSuccess) {

      awardList = result.data ?? [];

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

  Future<void> retry(
    BuildContext context,
  ) async {

    await getAwards(context);
  }
}