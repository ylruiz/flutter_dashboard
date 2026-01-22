import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/navigation_config.dart';

part 'navigation_provider.g.dart';

@riverpod
class Navigation extends _$Navigation {
  @override
  NavigationItemType build() {
    return NavigationItemType.dashboard;
  }

  void selectItem(NavigationItemType type) {
    state = type;
  }
}
