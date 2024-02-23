//   ///
//  Import LIBRARIES ILES
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:extended_image/extended_image.dart';
//  Import FILES
import '../models/game.dart';
import '../providers/live_game_provider.dart';
//  PARTS
//  PROVIDERS
//  //  //   ///

class LiveGamePage extends ConsumerStatefulWidget {
  const LiveGamePage({super.key});

  @override
  ConsumerState<LiveGamePage> createState() => _LiveGamePageState();
}

class _LiveGamePageState extends ConsumerState<LiveGamePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(liveGameNotifierProvider.notifier).fetchLiveGames();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Game Page'),
      ),
      body: Consumer(
        builder: (context, wiRef, child) {
          // List<Game> games = ref.watch(liveGameNotifierProvider);
          LiveGameState state = wiRef.watch(liveGameNotifierProvider);
          // if (games.isEmpty) {
          //   return const Center(child: CircularProgressIndicator());
          // }

          // Null
          if (state.status == '') return const SizedBox.shrink();

          // Loading
          if (state.status == 'loading') {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // Failed
          if (state.status == 'failed') {
            return Center(
              child: Text(state.message),
            );
          }
          List<Game> games = state.data;
          return GridView.builder(
            // itemCount: games.length,
            itemCount: games.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              // Game game = games[index];
              Game game = games[index];
              return ExtendedImage.network(
                game.thumbnail!,
                fit: BoxFit.cover,
              );
            },
          );
        },
      ),
    );
  }
}
