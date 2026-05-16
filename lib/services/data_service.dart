import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import '../core/utils/app_assets.dart';
import '../models/product_model.dart';

class DataService {
  static Future<LookupData> loadLookupData() async {
    // Assets loading must happen on the main isolate
    final String jsonString = await rootBundle.loadString(AppAssets.lookupJson);
    
    // Use compute to parse the JSON in a separate isolate
    return await compute(_parseLookupData, jsonString);
  }

  static LookupData _parseLookupData(String jsonString) {
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    return LookupData.fromJson(jsonMap);
  }
}
