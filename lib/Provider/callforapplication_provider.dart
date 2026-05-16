// import 'package:flutter/material.dart';
// import 'package:merckfoundation_252026/service/UpcomingApplicationService.dart';
// class CallApplicationProvider extends ChangeNotifier {
//   final service = UpcomingApplicationService();

//   List upcoming = [];
//   List past = [];

//   /// 🔹 Separate pagination
//   int upcomingPage = 1;
//   int pastPage = 1;

//   bool isLoading = false;

//   bool hasMoreUpcoming = true;
//   bool hasMorePast = true;

//   bool isFetchingMoreUpcoming = false;
//   bool isFetchingMorePast = false;

//   /// 🔹 INITIAL LOAD
//   Future<void> loadInitial(BuildContext context) async {
//     if (isLoading) return;

//     isLoading = true;
//     notifyListeners();

//     try {
//       /// 🔥 CALL BOTH APIs
//       final upcomingRes = await service.fetchUpcoming(context, 1);
//       final pastRes = await service.fetchPast(context, 1);

//       upcoming = upcomingRes.data ?? [];
//       past = pastRes.data ?? [];

//       upcomingPage = 1;
//       pastPage = 1;

//       hasMoreUpcoming = upcomingRes.next != null;
//       hasMorePast = pastRes.next != null;

//     } catch (e) {
//       print("Initial Error: $e");
//     }

//     isLoading = false;
//     notifyListeners();
//   }

//   /// 🔹 LOAD MORE UPCOMING
//   Future<void> loadMoreUpcoming(BuildContext context) async {
//     if (!hasMoreUpcoming || isFetchingMoreUpcoming) return;

//     isFetchingMoreUpcoming = true;
//     notifyListeners();

//     try {
//       final nextPage = upcomingPage + 1;

//       final res = await service.fetchUpcoming(context, nextPage);

//       upcoming.addAll(res.data ?? []);

//       upcomingPage = nextPage;
//       hasMoreUpcoming = res.next != null;

//     } catch (e) {
//       print("Upcoming LoadMore Error: $e");
//     }

//     isFetchingMoreUpcoming = false;
//     notifyListeners();
//   }

//   /// 🔹 LOAD MORE PAST
//   Future<void> loadMorePast(BuildContext context) async {
//     if (!hasMorePast || isFetchingMorePast) return;

//     isFetchingMorePast = true;
//     notifyListeners();

//     try {
//       final nextPage = pastPage + 1;

//       final res = await service.fetchPast(context, nextPage);

//       past.addAll(res.data ?? []);

//       pastPage = nextPage;
//       hasMorePast = res.next != null;

//     } catch (e) {
//       print("Past LoadMore Error: $e");
//     }

//     isFetchingMorePast = false;
//     notifyListeners();
//   }
// }

import 'package:flutter/material.dart';

import 'package:merckfoundation_252026/Utility/api_status.dart';
import 'package:merckfoundation_252026/service/UpcomingApplicationService.dart';

class CallApplicationProvider
    extends ChangeNotifier {

  final service =
      UpcomingApplicationService();

  /// =========================
  /// STATUS
  /// =========================

  ApiStatus status =
      ApiStatus.initial;

  String errorMessage = "";

  /// =========================
  /// DATA
  /// =========================

  List upcoming = [];

  List past = [];

  /// PAGINATION
  int upcomingPage = 1;

  int pastPage = 1;

  bool isLoading = false;

  bool hasMoreUpcoming = true;

  bool hasMorePast = true;

  bool isFetchingMoreUpcoming =
      false;

  bool isFetchingMorePast =
      false;

  /// =========================
  /// INITIAL LOAD
  /// =========================

  Future<void> loadInitial(
    BuildContext context,
  ) async {

    if (isLoading) return;

    isLoading = true;

    status = ApiStatus.loading;

    notifyListeners();

    final upcomingResult =
        await service.fetchUpcoming(
      context,
      1,
    );

    final pastResult =
        await service.fetchPast(
      context,
      1,
    );

    /// IF BOTH FAILED
    if (!upcomingResult.isSuccess &&
        !pastResult.isSuccess) {

      status = ApiStatus.error;

      errorMessage =
          upcomingResult.message ??
              pastResult.message ??
              "Something went wrong";

      isLoading = false;

      notifyListeners();

      return;
    }

    /// SUCCESS
    status = ApiStatus.success;

    /// UPCOMING
    if (upcomingResult.isSuccess) {

      final res =
          upcomingResult.data!;

      upcoming = res.data ?? [];

      upcomingPage = 1;

      hasMoreUpcoming =
          res.next != null;
    }

    /// PAST
    if (pastResult.isSuccess) {

      final res = pastResult.data!;

      past = res.data ?? [];

      pastPage = 1;

      hasMorePast =
          res.next != null;
    }

    isLoading = false;

    notifyListeners();
  }

  /// =========================
  /// LOAD MORE UPCOMING
  /// =========================

  Future<void> loadMoreUpcoming(
    BuildContext context,
  ) async {

    if (!hasMoreUpcoming ||
        isFetchingMoreUpcoming) {
      return;
    }

    isFetchingMoreUpcoming = true;

    notifyListeners();

    final nextPage =
        upcomingPage + 1;

    final result =
        await service.fetchUpcoming(
      context,
      nextPage,
    );

    if (result.isSuccess) {

      final res = result.data!;

      upcoming.addAll(
        res.data ?? [],
      );

      upcomingPage = nextPage;

      hasMoreUpcoming =
          res.next != null;
    }

    isFetchingMoreUpcoming = false;

    notifyListeners();
  }

  /// =========================
  /// LOAD MORE PAST
  /// =========================

  Future<void> loadMorePast(
    BuildContext context,
  ) async {

    if (!hasMorePast ||
        isFetchingMorePast) {
      return;
    }

    isFetchingMorePast = true;

    notifyListeners();

    final nextPage =
        pastPage + 1;

    final result =
        await service.fetchPast(
      context,
      nextPage,
    );

    if (result.isSuccess) {

      final res = result.data!;

      past.addAll(
        res.data ?? [],
      );

      pastPage = nextPage;

      hasMorePast =
          res.next != null;
    }

    isFetchingMorePast = false;

    notifyListeners();
  }

  /// =========================
  /// RETRY
  /// =========================

  Future<void> retry(
    BuildContext context,
  ) async {

    await loadInitial(context);
  }
}