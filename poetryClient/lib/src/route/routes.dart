import 'package:angular_router/angular_router.dart';

import './route_paths.dart';
import '../dashboard_component.template.dart' as dashboard_template;
import '../component/poetry_component.template.dart' as poetry_template;
import '../poetry_list_component.template.dart' as poetry_list_template;

export './route_paths.dart';

class Routes {
  static final dashboard = RouteDefinition(
    routePath: RoutePaths.dashboard,
    component: dashboard_template.DashboardComponentNgFactory,
  );

  static final poetry = RouteDefinition(
    routePath: RoutePaths.poetry,
    component: poetry_template.PoetryComponentNgFactory,
  );

  static final poetries = RouteDefinition(
    routePath: RoutePaths.poetries,
    component: poetry_list_template.PoetryListComponentNgFactory,
  );

  static final all = <RouteDefinition>[
    dashboard,
    poetry,
    poetries,
    RouteDefinition.redirect(
      path: '',
      redirectTo: RoutePaths.dashboard.toUrl(),
    ),
  ];
}
