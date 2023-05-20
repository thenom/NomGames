import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:nomgames/features/game/data/games_repository.dart';
import 'package:nomgames/features/game/ui/games_list/add_game_bottomsheet.dart';
import 'package:nomgames/features/game/ui/games_list/game_card.dart';
import 'package:nomgames/common/utils/colours.dart' as constants;

class GamesListPage extends HookConsumerWidget {
  const GamesListPage({
    super.key,
  });

  void showAddGameDialog(BuildContext context) async {
    await showModalBottomSheet<void>(
      isScrollControlled: true,
      elevation: 5,
      context: context,
      builder: (BuildContext context) {
        return AddGameBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    final gamesListValue = ref.watch(gamesListStreamProvider);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
           'NomGames Planner',
          ),
          backgroundColor: const Color(constants.primaryColorDark),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showAddGameDialog(context);
          },
          backgroundColor: const Color(constants.primaryColorDark),
          child: const Icon(Icons.add),
        ),
        body: gamesListValue.when(
            data: (games) => games.isEmpty
                ? const Center(
                    child: Text('No Games'),
                  )
                : Column(
                    children: [
                      Flexible(
                        child: GridView.count(
                          crossAxisCount:
                              (orientation == Orientation.portrait) ? 2 : 3,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                          padding: const EdgeInsets.all(4),
                          childAspectRatio:
                              (orientation == Orientation.portrait) ? 0.9 : 1.4,
                          children: games.map((gameData) {
                            return GameCard(game: gameData!);
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
            error: (e, st) => const Center(
                  child: Text('Error'),
                ),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )));
  }
}
