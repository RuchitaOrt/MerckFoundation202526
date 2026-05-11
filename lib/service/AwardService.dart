import 'package:merckfoundation_252026/Utility/APIManager.dart';
import 'package:merckfoundation_252026/main.dart';
import 'package:merckfoundation_252026/model/AwardResponse.dart';

class AwardService {
  Future<List<AwardModel>> fetchAward() async {
    final response = await APIManager().apiRequest(
      routeGlobalKey.currentContext!,
      API.getawardlist,
    );

    /// response = Map<String,dynamic>

    final List data = response['data'] ?? [];

    return data
        .map((e) => AwardModel.fromJson(e))
        .toList();
  }
}