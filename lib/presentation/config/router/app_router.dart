import 'package:todo_app/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(initialLocation: "/", routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => const HomeScreen(),
  ),
]);
