import 'package:hive_ce/hive_ce.dart';
import 'package:shopix_user/core/data/user_data.dart';

extension HiveRegistrar on HiveInterface {
  void registerAdapters() {
    registerAdapter(UserSettingsAdapter());
  }
}

extension IsolatedHiveRegistrar on IsolatedHiveInterface {
  void registerAdapters() {
    registerAdapter(UserSettingsAdapter());
  }
}
