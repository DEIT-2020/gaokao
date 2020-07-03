import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'src/route/routes.dart';
import 'src/service/poetry_service.dart';

@Component(
  selector: 'my-app',
  template: '''
    <h1>{{title}}</h1>
    <nav>
      <a [routerLink]="RoutePaths.dashboard.toUrl()"
         [routerLinkActive]="'active'">首页</a>
    </nav>
    <router-outlet [routes]="Routes.all"></router-outlet>
  ''',
  styleUrls: ['app_component.css'],
  directives: [routerDirectives],
  providers: [ClassProvider(PoetryService)],
  exports: [RoutePaths, Routes],
)
class AppComponent {
  // <a [routerLink]="RoutePaths.poetries.toUrl()"
  //  [routerLinkActive]="'active'">Poetries</a>
  final title = '古文词义查询';
}
