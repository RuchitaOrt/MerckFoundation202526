
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/api_status.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/model/CountryModel.dart';
import 'package:merckfoundation_252026/service/CountryService.dart';

class FilterProvider extends ChangeNotifier {

  final FilterService _service = FilterService();

  /// LISTS
  List<CountryModel> countries = [];

  List<CategoryModel> categories = [];

  List<CategoryModel> languages = [];

  /// SELECTED
  CountryModel? selectedCountry;

  CategoryModel? selectedCategory;

  CategoryModel? selectedLanguage;

  /// LOADING
  bool isLoading = false;

  ApiStatus status = ApiStatus.initial;

  String errorMessage = "";

  /// DEFAULT MODELS
  final CountryModel allCountry = CountryModel(
    id: 0,
    name: "All",
    code: "",
    isActive: false,
    catgname: "",
  );

  final CategoryModel allCategory = CategoryModel(
    id: 0,
    name: "All",
  );

  final CategoryModel allLanguage = CategoryModel(
    id: 0,
    name: "All",
  );

  /// LOAD FILTERS
  Future<void> loadFilters(
    BuildContext context, {
    required MediaType type,
  }) async {

    isLoading = true;

    status = ApiStatus.loading;

    errorMessage = "";

    notifyListeners();

    try {

      final countryId =
          selectedCountry?.id == 0
              ? ""
              : selectedCountry?.id.toString() ?? "";

      final categoryId =
          selectedCategory?.id == 0
              ? ""
              : selectedCategory?.id.toString() ?? "";

      /// =========================
      /// COUNTRY
      /// =========================

      if (type == MediaType.videoLibrary) {

        final result =
            await _service
                .fetchCountryVideoLibraryCategories(
          context,
          categoryId,
        );

        if (!result.isSuccess) {

          status = result.status;

          errorMessage =
              result.message ?? "";

          return;
        }

        final res =
            result.data ?? {};

        countries = [
          allCountry,
          ...(res['data'] ?? [])
              .map<CountryModel>(
                (e) =>
                    CountryModel.fromJson(e),
              )
              .toList(),
        ];

      } else {

        final result =
            await _service.fetchCountries(
          context,
        );

        if (!result.isSuccess) {

          status = result.status;

          errorMessage =
              result.message ?? "";

          return;
        }

        final res =
            result.data ?? {};

        countries = [
          allCountry,
          ...(res['data'] ?? [])
              .map<CountryModel>(
                (e) =>
                    CountryModel.fromJson(e),
              )
              .toList(),
        ];
      }

      /// =========================
      /// CATEGORY
      /// =========================

      if (type ==
          MediaType.testimonial) {

        final result =
            await _service
                .fetchTestimonialCategories(
          context,
          countryId,
        );

        if (!result.isSuccess) {

          status = result.status;

          errorMessage =
              result.message ?? "";

          return;
        }

        final res =
            result.data ?? {};

        categories = [
          allCategory,
          ...(res['data'] ?? [])
              .map<CategoryModel>(
                (e) =>
                    CategoryModel.fromJson(e),
              )
              .toList(),
        ];

      } else if (type ==
          MediaType.testimonialArticle) {

        final result =
            await _service
                .fetchTestimonialArticleCategories(
          context,
        );

        if (!result.isSuccess) {

          status = result.status;

          errorMessage =
              result.message ?? "";

          return;
        }

        final res =
            result.data ?? {};

        categories = [
          allCategory,
          ...(res['data'] ?? [])
              .map<CategoryModel>(
                (e) =>
                    CategoryModel.fromJson(e),
              )
              .toList(),
        ];

      } else if (type ==
          MediaType.digitalLibrary || type==MediaType.digitalLibraryall) {
        
        final result =
            await _service
                .fetchListDigitalCategories(
          context,
        );

        if (!result.isSuccess) {

          status = result.status;

          errorMessage =
              result.message ?? "";

          return;
        }

        final res =
            result.data ?? {};

        categories = [
          allCategory,
          ...(res['data'] ?? [])
              .map<CategoryModel>(
                (e) =>
                    CategoryModel.fromJson(e),
              )
              .toList(),
        ];

      } else {

        final result =
            await _service.fetchCategories(
          context,
          countryId,
        );

        if (!result.isSuccess) {

          status = result.status;

          errorMessage =
              result.message ?? "";

          return;
        }

        final res =
            result.data ?? {};

        categories = [
          allCategory,
          ...(res['data'] ?? [])
              .map<CategoryModel>(
                (e) =>
                    CategoryModel.fromJson(e),
              )
              .toList(),
        ];
      }

      /// =========================
      /// LANGUAGE
      /// =========================

      if (type ==
          MediaType.digitalLibrary || type==MediaType.digitalLibraryall) {

        final result =
            await _service
                .fetchLanguageByDigitalCategories(
          context,
          selectedCategory?.id == 0
              ? ""
              : selectedCategory!.id
                  .toString(),
        );

        if (!result.isSuccess) {

          status = result.status;

          errorMessage =
              result.message ?? "";

          return;
        }

        final res =
            result.data ?? {};

        languages = [
          allLanguage,
          ...(res['data'] ?? [])
              .map<CategoryModel>(
                (e) => CategoryModel(
                  id: e['id'],
                  name: e['language'],
                ),
              )
              .toList(),
        ];

      } else {

        languages = [
          allLanguage,
        ];
      }

      /// DEFAULT SELECTED
      selectedCountry ??= allCountry;

      selectedCategory ??=
          allCategory;

      selectedLanguage ??=
          allLanguage;

      status = ApiStatus.success;

    } catch (e) {

      errorMessage = e.toString();

      final error =
          e.toString().toLowerCase();

      if (error.contains("socket")) {

        status =
            ApiStatus.noInternet;

      } else if (error
          .contains("timeout")) {

        status =
            ApiStatus.timeout;

      } else if (error
          .contains("500")) {

        status =
            ApiStatus.serverError;

      } else {

        status =
            ApiStatus.error;
      }

      debugPrint(
        "Filter Error: $e",
      );

    } finally {

      isLoading = false;

      notifyListeners();
    }
  }

  /// SELECT COUNTRY
  void selectCountry(
    CountryModel value,
  ) {

    selectedCountry = value;

    notifyListeners();
  }

  /// SELECT CATEGORY
  void selectCategory(
    CategoryModel value,
  ) {

    selectedCategory = value;

    /// RESET LANGUAGE
    selectedLanguage =
        allLanguage;

    notifyListeners();
  }

  /// SELECT LANGUAGE
  void selectLanguage(
    CategoryModel value,
  ) {

    selectedLanguage = value;

    notifyListeners();
  }

  /// CLEAR FILTERS
  void clearFilters() {

    selectedCountry =
        allCountry;

    selectedCategory =
        allCategory;

    selectedLanguage =
        allLanguage;

    notifyListeners();
  }

  /// RETRY
  Future<void> retryFilters(
    BuildContext context, {
    required MediaType type,
  }) async {

    await loadFilters(
      context,
      type: type,
    );
  }
}