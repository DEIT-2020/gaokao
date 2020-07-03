import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'route/route_paths.dart';
import 'entity/poetry.dart';
import 'component/poetry_component.dart';
import 'service/poetry_service.dart';

@Component(
  selector: 'my-poetries',
  templateUrl: 'poetry_list_component.html',
  styleUrls: ['poetry_list_component.css'],
  directives: [coreDirectives, PoetryComponent],
  pipes: [commonPipes],
)
class PoetryListComponent implements OnInit {
  final PoetryService _poetryService;
  final Router _router;
  List<Poetry> poetries;
  Poetry selected;

  PoetryListComponent(this._poetryService, this._router);

  Future<void> _getPoetries() async {
    poetries = await _poetryService.getAll();
  }

  // Future<void> add(String name) async {
  //   name = name.trim();
  //   if (name.isEmpty) return null;
  //   poetries.add(await _poetryService.create(name));
  //   selected = null;
  // }

  // Future<void> delete(Poetry poetry) async {
  //   await _poetryService.delete(poetry.id);
  //   poetries.remove(poetry);
  //   if (selected == poetry) selected = null;
  // }

  void ngOnInit() => _getPoetries();

  void onSelect(Poetry poetry) => selected = poetry;

  String _poetryUrl(int id) =>
      RoutePaths.poetry.toUrl(parameters: {idParam: '$id'});

  Future<NavigationResult> gotoDetail() =>
      _router.navigate(_poetryUrl(selected.id));
}
