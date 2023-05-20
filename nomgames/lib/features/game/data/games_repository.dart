import 'package:nomgames/features/game/services/games_datastore_service.dart';
import 'package:nomgames/models/Game.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final gamesRepositoryProvider = Provider<GamesRepository>((ref) {
  GamesDataStoreService gamesDataStoreService =
      ref.read(gamesDataStoreServiceProvider);
  return GamesRepository(gamesDataStoreService);
});

final gamesListStreamProvider = StreamProvider.autoDispose<List<Game?>>((ref) {
  final gamesRepository = ref.watch(gamesRepositoryProvider);
  return gamesRepository.getGames();
});

final pastGamesListStreamProvider =
    StreamProvider.autoDispose<List<Game?>>((ref) {
  final gamesRepository = ref.watch(gamesRepositoryProvider);
  return gamesRepository.getPastGames();
});

final gameProvider =
    StreamProvider.autoDispose.family<Game?, String>((ref, id) {
  final gamesRepository = ref.watch(gamesRepositoryProvider);
  return gamesRepository.get(id);
});

class GamesRepository {
  GamesRepository(this.gamesDataStoreService);

  final GamesDataStoreService gamesDataStoreService;

  Stream<List<Game>> getGames() {
    return gamesDataStoreService.listenToGames();
  }

  Future<void> add(Game game) async {
    await gamesDataStoreService.addGame(game);
  }

  Future<void> update(Game updatedGame) async {
    await gamesDataStoreService.updateGame(updatedGame);
  }

  Future<void> delete(Game deletedGame) async {
    await gamesDataStoreService.deleteGame(deletedGame);
  }

  Stream<Game> get(String id) {
    return gamesDataStoreService.getGameStream(id);
  }
}
