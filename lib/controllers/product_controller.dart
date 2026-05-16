import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../services/data_service.dart';

class DataController extends ChangeNotifier {
  LookupData? _data;
  bool _isLoading = false;
  String _selectedCategory = 'All';

  List<Product> get products {
    var result = _data?.products ?? [];
    return result
        .where(
          (element) =>
              _selectedCategory == "All" ||
              element.category == _selectedCategory,
        )
        .toList();
  }

  List<String> get categories => _data?.categories ?? [];

  bool get isLoading => _isLoading;

  String get selectedCategory => _selectedCategory;

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      _data = await DataService.loadLookupData();
    } catch (e) {
      debugPrint('Error loading products: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void selectCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }
}
