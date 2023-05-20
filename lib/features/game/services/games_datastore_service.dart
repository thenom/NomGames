import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:nomgames/models/Game.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final gamesDataStoreServiceProvider = Provider<GamesDataStoreService>((ref) {
  final service = GamesDataStoreService();
  return service;
});

class GamesDataStoreService {
  GamesDataStoreService();

  Stream<List<Game>> listenToGames() {
    return Amplify.DataStore.observeQuery(
      Game.classType,
      sortBy: [Game.GAMENAME.ascending()],
    )
        .map((event) => event.items
            .toList())
        .handleError(
      (error) {
        debugPrint('listenToGames: A Stream error happened');
      },
    );
  }

  Stream<Game> getGameStream(String id) {
    final gameStream =
        Amplify.DataStore.observeQuery(Game.classType, where: Game.ID.eq(id))
            .map((event) => event.items.toList().single);

    return gameStream;
  }

  Future<void> addGame(Game game) async {
    try {
      await Amplify.DataStore.save(game);
    } on Exception catch (error) {
      debugPrint(error.toString());
    }
  }

  Future<void> deleteGame(Game game) async {
    try {
      await Amplify.DataStore.delete(game);
    } on Exception catch (error) {
      debugPrint(error.toString());
    }
  }

  Future<void> updateGame(Game updatedGame) async {
    try {
      final gamesWithId = await Amplify.DataStore.query(
        Game.classType,
        where: Game.ID.eq(updatedGame.id),
      );

      final oldGame = gamesWithId.first;
      final newGame = oldGame.copyWith(
        gameName: updatedGame.gameName,
        description: updatedGame.description,
        releaseDate: updatedGame.releaseDate,
        gameImageKey: updatedGame.gameImageKey,
        gameImageUrl: updatedGame.gameImageUrl,
      );

      await Amplify.DataStore.save(newGame);
    } on Exception catch (error) {
      debugPrint(error.toString());
    }
  }
}
