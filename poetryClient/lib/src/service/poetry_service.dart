import 'dart:async';
import 'dart:convert';
import 'dart:html' as prefix0;

import 'package:http/http.dart' as _http;

import '../entity/poetry.dart';

class PoetryService {
  static final _headers = {'Content-Type': 'application/json'};
  static const _poetriesUrl = 'http://localhost:8888/';

  Future<List<Poetry>> getAll() async {
    try {
      final response = await _http.get(_poetriesUrl + 'queryAllPoetries');
      final poetries = (_extractData(response) as List)
          .map((json) => Poetry.fromJson(json))
          .toList();
      return poetries;
    } catch (e) {
      throw _handleError(e);
    }
  }

  dynamic _extractData(_http.Response resp) => json.decode(resp.body);

  Exception _handleError(dynamic e) {
    print(e); // for demo purposes only
    return Exception('Server error; cause: $e');
  }

  Future<Poetry> get(int id) async {
    try {
      final response =
          await _http.get(_poetriesUrl + 'queryPoetry/' + id.toString());
      final res = Poetry.fromJson(_extractData(response));
      print(res);
      return res;
    } catch (e) {
      throw _handleError(e);
    }
  }

  // Future<Poetry> create(String name) async {
  //   try {
  //     final response = await _http.post(_poetriesUrl,
  //         headers: _headers, body: json.encode({'name': name}));
  //     return Poetry.fromJson(_extractData(response));
  //   } catch (e) {
  //     throw _handleError(e);
  //   }
  // }

  // Future<Poetry> update(Poetry poetry) async {
  //   try {
  //     final url = '$_poetriesUrl/${poetry.id}';
  //     final response =
  //         await _http.put(url, headers: _headers, body: json.encode(poetry));
  //     return Poetry.fromJson(_extractData(response));
  //   } catch (e) {
  //     throw _handleError(e);
  //   }
  // }

  // Future<void> delete(int id) async {
  //   try {
  //     final url = '$_poetriesUrl/$id';
  //     await _http.delete(url, headers: _headers);
  //   } catch (e) {
  //     throw _handleError(e);
  //   }
  // }
}
