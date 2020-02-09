import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:the_basics/datamodels/season_details_model.dart';
import 'package:the_basics/viewmodels/episodes_view_models.dart';
import 'package:the_basics/widgets/episodes_list/episodes_list.dart';
import 'package:the_basics/widgets/season_details/season_details.dart';

class EpisodesView extends StatelessWidget {
  const EpisodesView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<EpisodesViewModel>.withConsumer(
      // step 2 - set the view model on the view
      // step 1. get/inject the viewmodel
      viewModel: EpisodesViewModel(),
      onModelReady: (model) => model.getEpisodes(),
      builder: (context, model, child) => SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          SeasonDetails(
            details: SeasonDetailsModel(
              title: 'SEASON 1',
              description:
                  'This season covers the absolute basics of Flutter Web Dev to get us up and running with a basic web app.',
            ),
          ),
          SizedBox(
            height: 50,
          ),
          model.episodes == null
              ? CircularProgressIndicator()
              : EpisodesList(
                  episodes: model.episodes), // step 3 pass the list to widgets
        ],
      )),
    );
  }
}
