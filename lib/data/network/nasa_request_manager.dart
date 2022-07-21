import 'dart:convert';
import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:flutter_nasa/data/bean/apod_image.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class NasaRequestManager {
  static Future<List<ApodImage>> fetchApodImage(http.Client client) async {
    final dateFormatter = DateFormat('yyyy-MM-dd');
    final now = DateTime.now();
    developer.log(now.toString(), name: 'now.toString()');
    final startDate =
        dateFormatter.format(now.subtract(const Duration(days: 30)));
    var endDate = dateFormatter.format(now);
    Uri uri = Uri(
        scheme: 'https',
        host: 'api.nasa.gov',
        path: 'planetary/apod',
        queryParameters: {
          'api_key': 'Yfd4Q4fO2TXiGrldiULPzS7fCL3IgQLtP1fhm6fY',
          'start_date': startDate,
          'end_date': endDate,
        });
    developer.log(uri.toString(), name: 'uri.toString()');
    final response = await client.get(uri);
    // developer.log(response.body, name: 'response.body');
    return compute(parseApodImage, response.body);
  }

  static List<ApodImage> parseApodImage(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    List<ApodImage> resultList =
        parsed.map<ApodImage>((json) => ApodImage.fromJson(json)).toList();
    resultList.sort((a, b) => (b.date.compareTo(a.date)));
    return resultList;
  }
}
