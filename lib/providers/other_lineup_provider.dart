import 'package:piehme_cup_flutter/dialogs/loading.dart';
import 'package:piehme_cup_flutter/models/player.dart';
import 'package:piehme_cup_flutter/models/user.dart';
import 'package:piehme_cup_flutter/providers/base_lineup_provider.dart';
import 'package:piehme_cup_flutter/services/players_service.dart';
import 'package:piehme_cup_flutter/services/users_service.dart';

class OtherLineupProvider extends BaseLineupProvider {

  late List<Player> _lineup = <Player>[];
  late int _avgRating = 0;
  late int _lineupRating = 0;
  late int _maxRating = 0;
  late User _user = User.empty();

  @override
  List<Player> get lineup => _lineup;
  @override
  int get avgRating => _avgRating;
  @override
  int get lineupRating => _lineupRating;
  @override
  int get maxRating => _maxRating;
  @override
  User get user => _user;

  @override
  Future<void> loadLineup(int userId) async {
    _lineup = [];
    _user = User.empty();
    _lineupRating = 0;

    await Loading.show(() async {
      _avgRating = 0;
      _maxRating = 0;

      final results = await Future.wait([
      // LeaderboardService.getStats(),
      PlayersService.getLineupById(userId),
      UsersService.getOtherUserIcon(userId)
      ]);
      // List<int> stats = results[0] as List<int>;
      _lineup = results[0] as List<Player>;
      _user = results[1] as User;

      resetAddedCards();
      // _avgRating = stats[0];
      // _maxRating = stats[1];
      _lineupRating = _user.lineupRating.round();
      notifyListeners();
    }, message: 'Loading Lineup...', delay: Duration.zero);
  }

}