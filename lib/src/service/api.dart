import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dasar/src/config/env.dart';
import 'package:dasar/src/models/pos_model.dart';
import 'package:http/http.dart';
import 'package:riverpod/riverpod.dart';

class ApiService {
  Future getPos() async {
    try {
      Response response = await get(Uri.parse("$baseUrl/patrol/list"),
          headers: {"Authorization": "Bearer 4|oTiB0SupfJBB5LHEZx0Fq2hLRr3hHoIJfeRwpYDT"});
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        return result;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } on SocketException {
      throw Exception('No Internet connection');
    } on TimeoutException {
      throw Exception(
          'API not responded in time');
    }
  }
}

final provider = Provider<ApiService>((ref) => ApiService());
