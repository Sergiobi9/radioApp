import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:radio_app/features/radio_station_detail/ui/view_model/radio_station_detail_view_model.dart';
import 'package:radio_app/features/radio_station_detail/ui/widgets/bottom_radio_station_detail_buttons.dart/bottom_radio_station_detail_buttons_component.dart';
import 'package:radio_app/features/radio_station_detail/ui/widgets/radio_station_detail_image/radio_station_detail_info_component.dart';

class RadioStationDetailPage extends StatefulWidget {
  RadioStationDetailPage({Key? key}) : super(key: key);

  @override
  State<RadioStationDetailPage> createState() => _RadioStationDetailPageState();
}

class _RadioStationDetailPageState extends State<RadioStationDetailPage> {
  RadioStationDetailViewModel viewModel =
      GetIt.instance.get<RadioStationDetailViewModel>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RadioStationDetailViewModel>(
        create: (_) => viewModel,
        child: Consumer<RadioStationDetailViewModel>(
            builder: (context, viewModel, _) => Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.white,
                    automaticallyImplyLeading: true,
                    iconTheme: const IconThemeData(color: Colors.black),
                    elevation: 0,
                    title: Text(
                      viewModel.getRadioStation().name,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  body: Column(
                    children: [
                      Expanded(
                          child: RadioStationDetailInfoComponent(
                        radioStation: viewModel.getRadioStation(),
                        onImagePressed: () {
                          viewModel.stopPlayRadioStation();
                        },
                      )),
                      BottomRadioStationDetailButtonsComponent(
                        onShuffleButtonPressed: () {
                          viewModel.changeShuffleRadio();
                        },
                        onPreviousButtonPressed: () {
                          viewModel.getPreviousRadioStation();
                        },
                        onPlayPauseButtonPressed: () {
                          viewModel.stopPlayRadioStation();
                        },
                        onNextButtonPressed: () {
                          viewModel.getNextRadioStation();
                        },
                        onShareButtonPressed: () {
                          viewModel.shareRadioStation();
                        },
                        onVolumeChanged: (volume) {
                          viewModel.setAudioVolume(volume: volume);
                        },
                        isPlaying: viewModel.getRadioStation().isPlaying,
                        isShuffleSelected: viewModel.isShuffleSelected(),
                        currentVolume: viewModel.getAudioVolume(),
                      )
                    ],
                  ),
                )));
  }
}
