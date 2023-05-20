import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:nomgames/features/game/data/games_repository.dart';
import 'package:nomgames/models/ModelProvider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final gamesListControllerProvider = Provider<GamesListController>((ref) {
  return GamesListController(ref);
});

class GamesListController {
  GamesListController(this.ref);
  final Ref ref;

  Future<void> add({
    required String name,
    required String description,
    required String releaseDate,
  }) async {
    Game game = Game(
      gameName: name,
      description: description,
      releaseDate: TemporalDate(DateTime.parse(releaseDate)),
    );

    final gamesRepository = ref.read(gamesRepositoryProvider);

    await gamesRepository.add(game);
  }
}
