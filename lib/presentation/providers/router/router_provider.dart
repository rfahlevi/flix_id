import 'package:flix_id/domain/entities/movie.dart';
import 'package:flix_id/presentation/pages/detail-page/detail_page.dart';
import 'package:flix_id/presentation/pages/login-page/login_page.dart';
import 'package:flix_id/presentation/pages/main-page/main_page.dart';
import 'package:flix_id/presentation/pages/register-page/register_page.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

@Riverpod(keepAlive: true)
Raw<GoRouter> router(RouterRef ref) => GoRouter(
      initialLocation: '/login',
      debugLogDiagnostics: false,
      routes: [
        GoRoute(
          path: '/main',
          name: 'main',
          builder: (context, state) => const MainPage(),
        ),
        GoRoute(
          path: '/login',
          name: 'login',
          builder: (context, state) => LoginPage(),
        ),
        GoRoute(
          path: '/register',
          name: 'register',
          builder: (context, state) => RegisterPage(),
        ),
        GoRoute(
          path: '/detail',
          name: 'detail',
          builder: (context, state) => DetailPage(movie: state.extra as Movie),
        ),
      ],
    );
