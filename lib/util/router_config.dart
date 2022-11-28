import 'package:go_router/go_router.dart';
import 'package:real_brew/ui/screens/detail_screen.dart';
import 'package:real_brew/ui/screens/home_screen.dart';

// GoRouter configuration
final routerConfig = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/detail',
      builder: (context, state) => const DetailScreen(),
    ),
  ],
);