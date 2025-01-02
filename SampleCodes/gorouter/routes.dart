import 'package:flutter_go_router_example/pages/error_page.dart';
import 'package:flutter_go_router_example/pages/home_page.dart';
import 'package:flutter_go_router_example/pages/post_detail_page.dart';
import 'package:flutter_go_router_example/pages/post_list_page.dart';
import 'package:flutter_go_router_example/pages/search_page.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  // 최초 위치
  initialLocation: '/',
  // redirect: (context, state) {
  //   if(특정한 조건){
  //     return 다른경로
  //   }
  //   // redirect
  //   return null;
  // },
  // 잘못된 경로 입력했을 때
  errorBuilder: (context, state) {
    return const ErrorPage();
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'post',
          builder: (context, state) => const PostListPage(),
          routes: [
            GoRoute(
              path: ':id',
              builder: (context, state) {
                // GoRouterState
                // path parameter는 string 타입으로 넘어옴
                final id = int.tryParse(state.pathParameters['id'] ?? '');
                if (id == null) {
                  return const ErrorPage();
                }
                return PostDetailPage(id: id);
              },
            ),
          ],
        ),
        GoRoute(
          path: 'search',
          builder: (context, state) {
            // GoRouterState
            // url 뒤의 쿼리 파라미터에 접근
            final text = state.uri.queryParameters['text'] ?? '';
            if (text.trim().isEmpty) {
              return const ErrorPage();
            }
            return SearchPage(text: text);
          },
        ),
      ],
    ),
  ],
);
