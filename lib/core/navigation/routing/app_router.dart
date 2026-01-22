import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';
import 'paths.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(path: Paths.dashboard, page: DashboardRoute.page, initial: true),
    AutoRoute(path: Paths.graphics, page: GraphicsRoute.page),
    AutoRoute(path: Paths.reports, page: ReportsRoute.page),
    AutoRoute(path: Paths.tables, page: TablesRoute.page),
  ];
}
