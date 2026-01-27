import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';
import 'paths.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      path: Paths.root,
      page: HomeRoute.page,
      maintainState: false,
      children: [
        CustomRoute(
          path: Paths.dashboard,
          page: DashboardRoute.page,
          initial: true,
        ),
        CustomRoute(path: Paths.graphics, page: GraphicsRoute.page),
        CustomRoute(path: Paths.reports, page: ReportsRoute.page),
        CustomRoute(path: Paths.tables, page: TablesRoute.page),
      ],
    ),
  ];
}
