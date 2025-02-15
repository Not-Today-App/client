import 'dart:convert';
import 'package:flutter/services.dart';
import '../../../config/assets.dart';
import '../../../domain/models/addiction/addiction.dart';
import '../../../domain/models/user/user.dart';

class LocalDataService {
  Future<List<Addiction>> getAddictions() async {
    final json = await _loadStringAsset(Assets.addictions);
    return json.map<Addiction>(Addiction.fromJson).toList();
  }

  Future<List<Map<String, dynamic>>> _loadStringAsset(String asset) async {
    final localData = await rootBundle.loadString(asset);
    return (jsonDecode(localData) as List).cast<Map<String, dynamic>>();
  }

  User getUser() {
    return const User(
      name: 'Alex',
      picture: 'assets/user.jpg',
    );
  }
}
