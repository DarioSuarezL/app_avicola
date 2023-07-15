import 'package:app_avicola/presentation/screens/usuarios/usuarios_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:app_avicola/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      name: HomeScreen.routeName,
      path: '/home',
      builder: (context, state) => const HomeScreen() ,
    ),

    // Auth routes
    GoRoute(
      name: LoginScreen.routeName,
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: UsuarioScreen.routeName,
      path: '/usuario',
      builder: (context, state) => const UsuarioScreen(),
    ),
    GoRoute(
      name: ChangePwdScreen.routeName,
      path: '/changepwd',
      builder: (context, state) => const ChangePwdScreen(),
    ),

    // Usuarios routes
    GoRoute(
      name: RegisterScreen.routeName,
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      name: UsuariosScreen.routeName,
      path: '/usuarios',
      builder: (context, state) => const UsuariosScreen() ,
    ),

    // Galpones routes
    GoRoute(
      name: GalponesScreen.routeName,
      path: '/galpones',
      builder: (context, state) => const GalponesScreen() ,
    ),
    
    // Aves routes
    GoRoute(
      name: AvesScreen.routeName,
      path: '/aves',
      builder: (context, state) => const AvesScreen() ,
    ),

    // Lotes routes
    GoRoute(
      name: LotesScreen.routeName,
      path: '/lotes',
      builder: (context, state) => const LotesScreen() ,
    ),

    // Alertas routes
    GoRoute(
      name: AlertasScreen.routeName,
      path: '/alertas',
      builder: (context, state) => const AlertasScreen() ,
    ),

    // Vacunas routes
    GoRoute(
      name: VacunasScreen.routeName,
      path: '/vacunas',
      builder: (context, state) => const VacunasScreen() ,
    ),
    
  ]

  
);