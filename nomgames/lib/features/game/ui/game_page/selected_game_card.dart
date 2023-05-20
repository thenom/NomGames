import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import 'package:nomgames/features/game/controller/game_controller.dart';
import 'package:nomgames/common/navigation/router/routes.dart';
import 'package:nomgames/common/utils/colours.dart' as constants;

import 'package:nomgames/models/Game.dart';
import 'package:nomgames/features/game/ui/game_page/delete_game_dialog.dart';
import 'package:nomgames/common/ui/upload_progress_dialog.dart';

class SelectedGameCard extends ConsumerWidget {
  const SelectedGameCard({
    required this.game,
    super.key,
  });

  final Game game;

  Future<void> uploadImage({
    required BuildContext context,
    required WidgetRef ref,
    required Game game,
  }) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) {
      return;
    }

    final file = File(pickedFile.path);
    showDialog<String>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const UploadProgressDialog();
        });
    await ref.read(gameControllerProvider).uploadFile(file, game);
  }

  Future<bool> deleteGame(
      BuildContext context, WidgetRef ref, Game game) async {
    var value = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return const DeleteGameDialog();
        });
    value ??= false;

    if (value) {
      await ref.read(gameControllerProvider).delete(game);
    }
    return value;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            game.gameName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            alignment: Alignment.center,
            color: const Color(constants.primaryColorDark), //Color(0xffE1E5E4),
            height: 150,

            child: game.gameImageUrl != null
                ? Stack(children: [
                    const Center(child: CircularProgressIndicator()),
                    CachedNetworkImage(
                      cacheKey: game.gameImageKey,
                      imageUrl: game.gameImageUrl!,
                      width: double.maxFinite,
                      height: 500,
                      alignment: Alignment.topCenter,
                      fit: BoxFit.fill,
                    ),
                  ])
                : Image.asset(
                    'images/amplify.png',
                    fit: BoxFit.contain,
                  ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  context.goNamed(
                    AppRoute.editgame.name,
                    params: {'id': game.id},
                    extra: game,
                  );
                },
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () {
                  uploadImage(
                    context: context,
                    game: game,
                    ref: ref,
                  ).then((value) =>
                      Navigator.of(context, rootNavigator: true).pop());
                },
                icon: const Icon(Icons.camera_enhance_sharp),
              ),
              IconButton(
                onPressed: () {
                  deleteGame(context, ref, game).then((value) {
                    if (value) {
                      context.goNamed(
                        AppRoute.home.name,
                      );
                    }
                  });
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          )
        ],
      ),
    );
  }
}
