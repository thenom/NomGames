import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:nomgames/common/navigation/router/routes.dart';
import 'package:nomgames/features/game/controller/game_controller.dart';
import 'package:nomgames/models/ModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:nomgames/common/utils/colours.dart' as constants;

class EditGamePage extends HookConsumerWidget {
  EditGamePage({
    required this.game,
    super.key,
  });
  final Game game;

  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameNameController = useTextEditingController(text: game.gameName);
    final descriptionController =
        useTextEditingController(text: game.description);
    final releaseDateController = useTextEditingController(
        text: DateFormat('yyyy-MM-dd').format(game.releaseDate.getDateTime()));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
         'Amplify Games Planner',
        ),
        leading: IconButton(
          onPressed: () {
            context.goNamed(
              AppRoute.game.name,
              params: {'id': game.id},
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: const Color(constants.primaryColorDark),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formGlobalKey,
          child: Container(
            padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                bottom: MediaQuery.of(context).viewInsets.bottom + 15),
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  //initialValue: game.gameName,
                  controller: gameNameController,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    const validationError = 'Enter a valid game name';
                    if (value == null || value.isEmpty) {
                      return validationError;
                    }

                    return null;
                  },
                  autofocus: true,
                  autocorrect: false,
                  decoration: const InputDecoration(hintText: "Game Name"),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  //initialValue: game.description,
                  keyboardType: TextInputType.name,
                  controller: descriptionController,
                  autofocus: true,
                  autocorrect: false,
                  decoration:
                      const InputDecoration(hintText: "Game Destination"),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      return null;
                    } else {
                      return 'Enter a valid description';
                    }
                  },
                ),
                TextFormField(
                  // initialValue: game.releaseDate.toString(),
                  keyboardType: TextInputType.datetime,
                  controller: releaseDateController,
                  autofocus: true,
                  autocorrect: false,
                  decoration: const InputDecoration(hintText: "Start Date"),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      return null;
                    } else {
                      return 'Enter a valid date';
                    }
                  },
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      releaseDateController.text = formattedDate;
                    } else {}
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    child: const Text('OK'),
                    onPressed: () async {
                      final currentState = formGlobalKey.currentState;
                      if (currentState == null) {
                        return;
                      }
                      if (currentState.validate()) {
                        final updatedGame = game.copyWith(
                          gameName: gameNameController.text,
                          description: descriptionController.text,
                          releaseDate: TemporalDate(
                              DateTime.parse(releaseDateController.text)),
                        );
                        ref.read(gameControllerProvider).edit(updatedGame);
                        context.goNamed(
                          AppRoute.game.name,
                          params: {'id': game.id},
                        );
                      }
                    } //,
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
