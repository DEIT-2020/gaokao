import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'entity/poetry.dart';
import './service/poetry_service.dart';
import './component/poetry_search_component.dart';
import './route/route_paths.dart';

@Component(
  selector: 'my-dashboard',
  templateUrl: 'dashboard_component.html',
  styleUrls: ['dashboard_component.css'],
  directives: [coreDirectives, PoetrySearchComponent, routerDirectives],
)
class DashboardComponent implements OnInit {
  List<Poetry> poetries;

  final PoetryService _poetryService;

  DashboardComponent(this._poetryService);

  String poetryUrl(int id) =>
      RoutePaths.poetry.toUrl(parameters: {idParam: '$id'});

  @override
  void ngOnInit() async {
    poetries = (await _poetryService.getAll()).toList();
  }
}
