import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:resep_sedep/models/drink_model.dart';

class DrinkServices {
  static Future<List<DrinkModel>> getDrinksFromJSON() async {
    try {
      final result =
          jsonDecode(await rootBundle.loadString('assets/json/drink.json'))
              as List;
      return result.map((food) => DrinkModel.fromJSON(food)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
