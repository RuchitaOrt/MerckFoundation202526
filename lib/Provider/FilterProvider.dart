import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/model/CountryModel.dart';
import 'package:merckfoundation_252026/service/CountryService.dart';
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/model/CountryModel.dart';


class FilterProvider extends ChangeNotifier {

  final FilterService _service = FilterService();

  /// 🔹 Data Lists
  List<CountryModel> countries = [];
  List<CategoryModel> categories = [];

  /// 🔹 Selected Values
  CountryModel? selectedCountry;
  CategoryModel? selectedCategory;

  bool isLoading = false;

  /// 🔹 Load filters
  Future<void> loadFilters(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    try {
      /// COUNTRY
      final countryRes = await _service.fetchCountries(context);
      countries = (countryRes['data'] ?? [])
          .map<CountryModel>((e) => CountryModel.fromJson(e))
          .toList();

      /// CATEGORY
      final categoryRes = await _service.fetchCategories(context,selectedCountry!.id.toString());
      categories = (categoryRes['data'] ?? [])
          .map<CategoryModel>((e) => CategoryModel.fromJson(e))
          .toList();

    } catch (e) {
      debugPrint("Filter Error: $e");
    }

    isLoading = false;
    notifyListeners();
  }

  /// 🔹 Selectors
  void selectCountry(CountryModel value) {
    selectedCountry = value;
    notifyListeners();
  }

  void selectCategory(CategoryModel value) {
    selectedCategory = value;
    notifyListeners();
  }

  void clearFilters() {
    selectedCountry = null;
    selectedCategory = null;
    notifyListeners();
  }


  
}