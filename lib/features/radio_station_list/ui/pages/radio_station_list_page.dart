import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:radio_app/core/manager/audio/audio_player_manager.dart';
import 'package:radio_app/core/manager/audio/interface/i_audio_player_manager.dart';
import 'package:radio_app/core/ui/widgets/loading/loading_component.dart';
import 'package:radio_app/core/ui/widgets/search/search_component.dart';
import 'package:radio_app/features/radio_station_list/network/model/radio_station.dart';
import 'package:radio_app/features/radio_station_list/ui/view_model/radio_station_list_view_model.dart';
import 'package:provider/provider.dart';
import 'package:radio_app/features/radio_station_list/ui/widgets/radio_station_country_selector/radio_station_country_selector_component.dart';
import 'package:radio_app/features/radio_station_list/ui/widgets/radio_station_item_list/radio_station_item_list_component.dart';
import 'package:radio_app/features/radio_station_list/ui/widgets/radio_station_selected_bottom_bar/radio_station_selected_bottom_bar.dart';

class RadioStationListPage extends StatefulWidget {
  const RadioStationListPage({Key? key}) : super(key: key);

  @override
  State<RadioStationListPage> createState() => _RadioStationListPageState();
}

class _RadioStationListPageState extends State<RadioStationListPage> {
  RadioStationListViewModel viewModel =
      GetIt.instance.get<RadioStationListViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.fetchRadioStations();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RadioStationListViewModel>(
        create: (_) => viewModel,
        child: Consumer<RadioStationListViewModel>(
          builder: (context, viewModel, _) => Scaffold(
            body: SafeArea(child: getRadioStations()),
            bottomNavigationBar: viewModel.getRadioStationCurrentlyPlaying() !=
                    null
                ? RadioStationSelectedBottomBar(
                    radioStation: viewModel.getRadioStationCurrentlyPlaying()!,
                    onShufflePressed: () {
                      viewModel.changeShuffleRadio();
                    },
                    isShuffleSelected: viewModel.isShuffleSelected(),
                    onItemPressed: (RadioStation radioStation) {
                      viewModel.seeRadioStationDetail(context: context);
                    },
                    onPausePlayPressed: () async {
                      await stopResumeRadioStation();
                    },
                    onSwipeLeft: () async {
                      viewModel.getNextRadioStation();
                    },
                    onSwipeRight: () async {
                      viewModel.getPreviousRadioStation();
                    },
                    onSwipeUp: () {
                      viewModel.seeRadioStationDetail(
                        context: context,
                      );
                    },
                  )
                : null,
          ),
        ));
  }

  stopResumeRadioStation() {
    viewModel.stopPlayRadioStation();
  }

  getRadioStations() {
    if (viewModel.isLoading()) {
      return Center(
        child: LoadingComponent(
          message: "Loading radio stations from " + viewModel.getCountryName(),
        ),
      );
    }

    return Column(
      children: [
        getSearchComponent(),
        Expanded(
            child: RadioStationItemListComponent(
          radioStations: viewModel.getRadioStationsList(),
          onItemPressed: (RadioStation radioStation) async {
            viewModel.changeRadioStationCurrentlyPlaying(radioStation);
            await stopResumeRadioStation();
          },
        )),
      ],
    );
  }

  getSearchComponent() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SearchComponent(
                onChanged: (value) {
                  viewModel.filterRadioStations(text: value);
                },
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 100,
              child: RadioStationCountrySelectorComponent(
                dropdownValue: viewModel.getCountryCode(),
                onChanged: (countryCode) {
                  viewModel.fetchRadioStations(countryCode: countryCode);
                },
              ),
            ),
          ],
        ));
  }
}
