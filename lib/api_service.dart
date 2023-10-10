import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:tutorial_api_git/repository_model.dart';

class ApiService {
  static const baseUrl = "api.github.com";

  static Future<dynamic> getRepositories() async {
    var url = Uri.https(baseUrl, '/repositories');
    var response = await http.get(url);

    var repositories = (json.decode(response.body))
        .map((item) => RepositoryModel.fromJson(item))
        .toList();

    return repositories;
  }
}
