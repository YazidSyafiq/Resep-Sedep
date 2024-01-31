import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:resep_sedep/models/food_model.dart';

class FoodServices {
  static Future<List<FoodModel>> getFoodsFromJSON() async {
    try {
      final result =
          jsonDecode(await rootBundle.loadString('assets/json/food.json'))
              as List;
      return result.map((food) => FoodModel.fromJSON(food)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
