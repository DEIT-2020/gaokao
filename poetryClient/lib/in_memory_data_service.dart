// import 'dart:async';
// import 'dart:convert';
// import 'dart:math';

// import 'package:http/http.dart';
// import 'package:http/testing.dart';

// import 'src/entity/poetry.dart';

// class InMemoryDataService extends MockClient {
//   static final _initialPoetries = [
//     {'id': 1, 'name': 'test1'},
//     {'id': 2, 'name': 'test2'},
//     {'id': 3, 'name': 'test3'},
//     {'id': 4, 'name': 'test4'},
//     {'id': 5, 'name': 'test5'},
//     {'id': 6, 'name': 'test6'},
//     {'id': 7, 'name': 'test7'},
//     {'id': 8, 'name': 'test8'},
//     {'id': 9, 'name': 'test9'},
//     {'id': 10, 'name': 'test10'}
//   ];
//   static List<Poetry> _poetriesDb;
//   static int _nextId;

//   static Future<Response> _handler(Request request) async {
//     if (_poetriesDb == null) resetDb();
//     var data;
//     switch (request.method) {
//       case 'GET':
//         final id = int.tryParse(request.url.pathSegments.last);
//         if (id != null) {
//           data = _poetriesDb.firstWhere((poetry) => poetry.id == id);
//         } else {
//           print(request.url);
//           String prefix = request.url.queryParameters['name'] ?? '';
//           final regExp = RegExp(prefix, caseSensitive: false);
//           data = _poetriesDb
//               .where((poetry) => poetry.name.contains(regExp))
//               .toList();
//         }
//         break;
//       case 'POST':
//         var name = json.decode(request.body)['name'];
//         var newPoetry = Poetry(_nextId++, name);
//         _poetriesDb.add(newPoetry);
//         data = newPoetry;
//         break;
//       case 'PUT':
//         var poetryChanges = Poetry.fromJson(json.decode(request.body));
//         var targetPoetry =
//             _poetriesDb.firstWhere((h) => h.id == poetryChanges.id);
//         targetPoetry.name = poetryChanges.name;
//         data = targetPoetry;
//         break;
//       case 'DELETE':
//         var id = int.parse(request.url.pathSegments.last);
//         _poetriesDb.removeWhere((poetry) => poetry.id == id);
//         break;
//       default:
//         throw 'Unimplemented HTTP method ${request.method}';
//     }
//     return Response(json.encode({'data': data}), 200,
//         headers: {'content-type': 'application/json'});
//   }

//   static resetDb() {
//     _poetriesDb =
//         _initialPoetries.map((json) => Poetry.fromJson(json)).toList();
//     _nextId = _poetriesDb.map((poetry) => poetry.id).fold(0, max) + 1;
//   }

//   static String lookUpName(int id) =>
//       _poetriesDb.firstWhere((poetry) => poetry.id == id, orElse: null)?.name;

//   InMemoryDataService() : super(_handler);
// }
