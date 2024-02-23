//   ///
//  Import LIBRARIES ILES
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//  Import FILES
import '../models/game.dart';
//  PARTS
//  PROVIDERS
//  OTHER
//   https://app.quicktype.io/
//   https://www.freetogame.com/api/games
//  //  //   ///

class GameSource {
  static Future<List<Game>?> getLive() async {
    String url = 'https://www.freetogame.com/api/games';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List list = jsonDecode(response.body);
        debugPrint(list.toString());
        return list.map((e) => Game.fromJson(Map.from(e))).toList();
      }

      return null;
    } catch (e) {
      return null;
    }
  }
}
