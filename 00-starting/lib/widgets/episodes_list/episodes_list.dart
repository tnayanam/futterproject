import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:the_basics/datamodels/episode_item_model.dart';
import 'package:the_basics/viewmodels/episode_list_view_model.dart';
import 'episode_item.dart';

class EpisodesList extends StatelessWidget {
  final List<EpisodeItemModel> episodes;
  EpisodesList({this.episodes});
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<EpisodeListViewModel>.withConsumer(
      viewModel: EpisodeListViewModel(),
      builder: (context, model, child) => Wrap(
        spacing: 30,
        runSpacing: 30,
        children: <Widget>[
          ...episodes
              .asMap()
              .map((index, episode) => MapEntry(
                    index,
                    GestureDetector(
                      child: EpisodeItem(model: episode),
                      onTap: () => model.navigateToEpisode(index),
                    ),
                  ))
              .values
              .toList()
        ],
      ),
    );
  }
}
