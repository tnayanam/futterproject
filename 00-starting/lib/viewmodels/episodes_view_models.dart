import 'package:flutter/cupertino.dart';
import 'package:the_basics/datamodels/episode_item_model.dart';
import 'package:the_basics/locator.dart';
import 'package:the_basics/services/api/api.dart';

class EpisodesViewModel extends ChangeNotifier {
  final _api = locator<Api>();

  List<EpisodeItemModel> _episodes;
  List<EpisodeItemModel> get episodes => _episodes;

  Future getEpisodes() async {
    var episodesResult = await _api.getEpisodes();

    if (episodesResult is String) {
      // error
    } else {
      _episodes = episodesResult;
    }

    notifyListeners();
  }
}
