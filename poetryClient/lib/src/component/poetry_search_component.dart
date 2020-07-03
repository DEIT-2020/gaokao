import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:stream_transform/stream_transform.dart';

import '../route/route_paths.dart';
import '../service/poetry_search_service.dart';
import '../entity/poetry.dart';

@Component(
  selector: 'poetry-search',
  templateUrl: 'poetry_search_component.html',
  styleUrls: ['poetry_search_component.css'],
  directives: [coreDirectives],
  providers: [ClassProvider(PoetrySearchService)],
  pipes: [commonPipes],
)
class PoetrySearchComponent implements OnInit {
  PoetrySearchService _poetrySearchService;
  Router _router;

  Stream<List<Poetry>> poetries;
  StreamController<String> _searchTerms = StreamController<String>.broadcast();

  PoetrySearchComponent(this._poetrySearchService, this._router) {}

  void search(String term) => _searchTerms.add(term);

  void ngOnInit() async {
    poetries = _searchTerms.stream
        .transform(debounce(Duration(milliseconds: 300)))
        .distinct()
        .transform(switchMap((term) => term.isEmpty
            ? Stream<List<Poetry>>.fromIterable([<Poetry>[]])
            : _poetrySearchService.search(term).asStream()))
        .handleError((e) {
      print(e); // for demo purposes only
    });
  }

  String _poetryUrl(int id) =>
      RoutePaths.poetry.toUrl(parameters: {idParam: '$id'});

  Future<NavigationResult> gotoDetail(Poetry poetry) =>
      _router.navigate(_poetryUrl(poetry.id));
}
