import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:radio_app/core/constants/country_constants.dart';
import 'package:radio_app/core/ui/widgets/image/network_image_component.dart';

class RadioStationCountrySelectorComponent extends StatefulWidget {
  String dropdownValue;
  Function(String countryCode) onChanged;
  RadioStationCountrySelectorComponent(
      {super.key, required this.dropdownValue, required this.onChanged});

  @override
  State<RadioStationCountrySelectorComponent> createState() =>
      _DropdownButtonExampleState();
}

class _DropdownButtonExampleState
    extends State<RadioStationCountrySelectorComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white),
        child: DropdownButton(
            isExpanded: true,
            underline: const SizedBox(),
            value: widget.dropdownValue,
            icon: const Icon(Icons.keyboard_arrow_down),
            elevation: 16,
            onChanged: (dynamic selectedValue) =>
                widget.onChanged(selectedValue),
            items: getCountries()));
  }

  getCountries() {
    return CountryConstants.COUNTRIES.map((Country country) {
      return DropdownMenuItem<String>(
          value: country.countryCode,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                NetworkImageComponent(
                    width: 35,
                    height: 25,
                    errorImage: Container(),
                    url:
                        "https://flagcdn.com/48x36/${country.countryCode.toLowerCase()}.png"),
                const SizedBox(
                  width: 10,
                ),
                Text(country.countryCode)
              ]));
    }).toList();
  }
}
