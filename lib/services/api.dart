import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nasa_apis/config/env.dart';
import 'package:nasa_apis/entity/astronomy_picture_of_day.dart';

class ApiService {
  Future<AstronomyPictureOfDay> fetchApod() async {
    final queryParams = {'api_key': Secret.api_key};

    final uri = Uri.https('api.nasa.gov', '/planetary/apod', queryParams);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return AstronomyPictureOfDay.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load apod');
    }
  }
}
