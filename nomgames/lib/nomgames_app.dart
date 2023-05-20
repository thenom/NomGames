import 'package:nomgames/features/game/ui/edit_game_page/edit_game_page.dart';
import 'package:nomgames/features/game/ui/game_page/game_page.dart';
import 'package:nomgames/features/game/ui/games_list/games_list_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:nomgames/common/navigation/router/routes.dart';
import 'package:nomgames/common/utils/colours.dart' as constants;

class GamesServerApp extends StatelessWidget {
  const GamesServerApp({
    required this.isAmplifySuccessfullyConfigured,
    Key? key,
  }) : super(key: key);

  final bool isAmplifySuccessfullyConfigured;

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          name: AppRoute.home.name,
          builder: (context, state) => isAmplifySuccessfullyConfigured
          ? const GamesListPage()
          : const Scaffold(
            body: Center(
              child: Text(
                'Tried to reconfigure Amplify; '
                'this can occur when your app restarts on Android.',
              ),
            ),
          ),
        ),
        GoRoute(
          path: '/game/:id',
          name: AppRoute.game.name,
          builder: (context, state) {
            final gameId = state.params['id']!;
            return GamePage(gameId: gameId);
          },
        ),
        GoRoute(
          path: '/editgame/:id',
          name: AppRoute.editgame.name,
          builder: (context, state) {
            return EditGamePage(
              game: state.extra! as Game,
            );
          },
        )
      ],
      errorBuilder: (context, state) => Scaffold(
        body: Center(
          child: Text(state.error.toString()),
        ),
      ),
      );

      return Authenticator(
        child: MaterialApp.router(
          routeInformationParser: router.routeInformationParser,
          routeInformationProvider: router.routeInformationProvider,
          routerDelegate: router.routerDelegate,
          builder: Authenticator.builder(),
          theme: ThemeData(
            primarySwatch: constants.primaryColor,
            backgroundColor: const Color(0xff82CFEA),
          ),
        ),
      );
  }
}
