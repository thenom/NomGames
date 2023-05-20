import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nomgames/common/services/storage_service.dart';

import 'package:nomgames/models/Game.dart';
import 'package:nomgames/features/game/data/games_repository.dart';

final gameControllerProvider = Provider<GameController>((ref) {
  return GameController(ref);
});

class GameController {
  GameController(this.ref);
  final Ref ref;

  Future<void> uploadFile(File file, Game game) async {
    final fileKey = await ref.read(storageServiceProvider).uploadFile(file);
    if (fileKey != null) {
      final imageUrl =
          await ref.read(storageServiceProvider).getImageUrl(fileKey);
      final updatedGame =
          game.copyWith(gameImageKey: fileKey, gameImageUrl: imageUrl);
      await ref.read(gamesRepositoryProvider).update(updatedGame);
      ref.read(storageServiceProvider).resetUploadProgress();
    }
  }

  ValueNotifier<double> uploadProgress() {
    return ref.read(storageServiceProvider).getUploadProgress();
  }

  Future<void> edit(Game updatedGame) async {
    final gamesRepository = ref.read(gamesRepositoryProvider);
    await gamesRepository.update(updatedGame);
  }

  Future<void> delete(Game deletedGame) async {
    final gamesRepository = ref.read(gamesRepositoryProvider);
    await gamesRepository.delete(deletedGame);
  }
}
