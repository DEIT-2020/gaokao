import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as _http;

import '../entity/poetry.dart';

class PoetrySearchService {
  static final _headers = {'Content-Type': 'application/json'};
  static const _poetriesUrl = 'http://localhost:8888/';

  Future<List<Poetry>> search(String term) async {
    try {
      final response =
          await _http.get(_poetriesUrl + 'queryPoetriesByKeyword/' + term);
      var res = (_extractData(response) as List)
          .map((json) => Poetry.fromJson(json))
          .toList();
      return res;
    } catch (e) {
      throw _handleError(e);
    }
  }

  dynamic _extractData(_http.Response resp) => json.decode(resp.body);

  Exception _handleError(dynamic e) {
    print(e); // for demo purposes only
    return Exception('Server error; cause: $e');
  }
}
