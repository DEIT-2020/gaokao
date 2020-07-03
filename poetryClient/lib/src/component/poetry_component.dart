import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

import '../entity/poetry.dart';
import '../service/poetry_service.dart';
import '../route/route_paths.dart';

@Component(
  selector: 'my-poetry',
  templateUrl: 'poetry_component.html',
  styleUrls: ['poetry_component.css'],
  directives: [coreDirectives, formDirectives],
)
class PoetryComponent implements OnActivate {
  Poetry poetry;
  final PoetryService _poetryService;
  final Location _location;

  PoetryComponent(this._poetryService, this._location);

  @override
  void onActivate(_, RouterState current) async {
    final id = getId(current.parameters);
    if (id != null) poetry = await (_poetryService.get(id));
  }

  // Future<void> save() async {
  //   await _poetryService.update(poetry);
  //   goBack();
  // }

  // void goBack() => _location.back();
}
