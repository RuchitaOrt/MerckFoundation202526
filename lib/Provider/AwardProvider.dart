import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/model/AwardResponse.dart';


import '../service/AwardService.dart';

class AwardProvider extends ChangeNotifier {
  final AwardService _service = AwardService();

  bool isLoading = false;

  List<AwardModel> awardList = [];

  Future<void> getAwards() async {
    try {
      isLoading = true;
      notifyListeners();

      awardList = await _service.fetchAward();

    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}