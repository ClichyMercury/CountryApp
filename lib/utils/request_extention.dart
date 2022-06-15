import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'package:flash_meteo/models/country_model/country_model.dart';
/* import 'package:get_it/get_it.dart'; */
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class RequestExtension<T> {
  static const String _urlEndpoint = 'https://restcountries.com/v3.1/name/';
  static const String _urlEndpointSimple =
      'https://restcountries.com/v3.1/name/';

  Future<dynamic> get(String url) async {
    print(url);
    print(
        "**************************************************************************************");
    print(_urlEndpoint + url);

    final response = await http.get(Uri.parse(_urlEndpoint + url), headers: {
      "Content-Type": "application/json; charset=utf-8",
    });
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(
          "£££££££££££££££££££££££££££££££££££££££££££££££££££££££££££££££££££££££££££££££££££");
    }
    switch (T) {
      case Country:
        print(jsonDecode(response.body)[0]);
        return Country.fromJson(json.decode(response.body)[0]) as T;
      default:
        Country.fromJson(json.decode(response.body)[0]) as T;
      //MedicalRecordsModel.fromJson(jsonDecode(response.body) as Map<String, dynamic>);    Country
    }
  }
}
