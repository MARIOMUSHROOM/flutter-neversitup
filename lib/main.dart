import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:never_test/auth.dart';
import 'package:never_test/service/api_service.dart';
import 'package:never_test/setting/config.dart';
import 'package:never_test/setting/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env", mergeWith: {});
  ApiService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: AppTheme.build(context),
      routerConfig: _router,
    );
  }
}

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Authenticate();
      },
    ),
    GoRoute(
      path: '/:id1',
      builder: (BuildContext context, GoRouterState state) {
        return Authenticate(
          deeplink: state.pathParameters['id1'],
        );
      },
    ),
  ],
);
