import 'package:go_router/go_router.dart';
import 'package:app_avicola/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/register',
  routes: [
    GoRoute(
      name: LoginScreen.routeName,
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: RegisterScreen.routeName,
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      name: HomeScreen.routeName,
      path: '/home',
      builder: (context, state) => const HomeScreen() ,
    ),
  ]
);