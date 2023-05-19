import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:test_minpro_insta/repository/post_repository.dart';
import 'package:test_minpro_insta/viewmodels/post_viewmodel.dart';

import '../manager/database_manager.dart';
import '../repository/user_repository.dart';
import '../viewmodels/login_viewmodel.dart';

List<SingleChildWidget> globalProviders = [
  ...independentModels,
  ...dependentModels,
  ...viewModels,
];

List<SingleChildWidget> independentModels = [
  Provider<DatabaseManager>(
    create: (_) {
      return DatabaseManager();
    },
  ),
];

List<SingleChildWidget> dependentModels = [
  ProxyProvider<DatabaseManager, UserRepository>(
    update: (_, databaseManager, userRepository) {
      return UserRepository(
        databaseManager: databaseManager,
      );
    },
  ),
  ProxyProvider<DatabaseManager, PostRepository>(
    update: (_, databaseManager, postRepository) {
      return PostRepository();
    },
  )
];

List<SingleChildWidget> viewModels = [
  ChangeNotifierProvider<LoginViewModel>(
    create: (context) {
      return LoginViewModel(
        userRepository: context.read<UserRepository>(),
      );
    },
  ),
  ChangeNotifierProvider<PostViewModel>(
    create: (context) {
      return PostViewModel(
        postRepository: context.read<PostRepository>(),
        userRepository: context.read<UserRepository>(),
      );
    },
  ),
];
