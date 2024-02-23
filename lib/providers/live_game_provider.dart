//   ///
//  Import LIBRARIES ILES
import 'package:fetch_api/source/game_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:equatable/equatable.dart';
//  Import FILES
import '../models/game.dart';
//  PARTS
part 'live_game_provider.g.dart';

//  PROVIDERS
// liveGameNotifierProvider
//  //  //   ///

@riverpod
class LiveGameNotifier extends _$LiveGameNotifier {
  // @override
  // List<Game> build() => const <Game>[];
  @override
  LiveGameState build() => const LiveGameState('', '', []);

  fetchLiveGames() async {
    state = const LiveGameState('Loading', 'Loading ...', []);
    await Future.delayed(const Duration(seconds: 2));
    // final games = await GameSource.getLive()
    final games = await GameSource.getLive();
    // if (games == null) return;
    if (games == null) {
      state = const LiveGameState(
          'Failed', 'Unfortunaltely, something went wrong!', []);
    } else {
      state = LiveGameState('Success!!!', '', games);
    }
  }

  addGame(Game game) {
    final data = [...state.data, game];
    state = LiveGameState('Success', 'message', data);
  }
}

class LiveGameState extends Equatable {
  final String status;
  final String message;
  final List<Game> data;

  const LiveGameState(this.status, this.message, this.data);

  @override
  List<Object?> get props => [status, message, data];
}
