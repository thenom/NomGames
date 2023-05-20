import 'package:flutter/material.dart';
import 'package:nomgames/common/utils/colours.dart' as constants;

class GamesListPage extends StatelessWidget {
  const GamesListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'NomGames Server Listing',
        ),
        backgroundColor: const Color(constants.primaryColorDark),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(constants.primaryColorDark),
        child: const Icon(Icons.add),
      ),
      body: const Center(
        child: Text('Games List'),
      ),
    );
  }
}
