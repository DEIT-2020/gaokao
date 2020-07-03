import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:poetry/app_component.template.dart' as ng;
import 'package:poetry/in_memory_data_service.dart';
import 'package:http/http.dart';

import 'main.template.dart' as self;

@GenerateInjector([
  routerProvidersHash,
  // ClassProvider(Client, useClass: InMemoryDataService),
])
final InjectorFactory injector = self.injector$Injector;

void main() {
  runApp(ng.AppComponentNgFactory, createInjector: injector);
  // Http.get('http://localhost:8888/queryAllPoetries').then((Http.Response res) {
  //   print(res);
  // });
}
