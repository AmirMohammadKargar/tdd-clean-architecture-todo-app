import 'package:go_router/go_router.dart';
import 'package:todo/features/todos/presentation/pages/todo_screen.dart';

class AppRouter {
  static var router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const TodoScreen(),
      ),
    ],
  );
}
