import 'package:angular_router/angular_router.dart';

const idParam = 'id';

class RoutePaths {
  static final dashboard = RoutePath(path: 'dashboard');
  static final poetries = RoutePath(path: 'poetries');

  static final poetry = RoutePath(path: '${poetries.path}/:$idParam');
}

int getId(Map<String, String> parameters) {
  final id = parameters[idParam];
  return id == null ? null : int.tryParse(id);
}
