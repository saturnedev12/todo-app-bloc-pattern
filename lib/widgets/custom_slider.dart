import 'package:flutter/material.dart';

class CusTomSlider extends StatelessWidget {
  CusTomSlider({Key? key, required this.currentValue, required this.maxValue})
      : super(key: key);
  final double currentValue;
  final double maxValue;
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: Colors.green,
        inactiveTrackColor: Colors.red[100],
        trackShape: RoundedRectSliderTrackShape(),
        trackHeight: 15.0,
        thumbColor: Colors.green,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0),
        overlayColor: Colors.red.withAlpha(32),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
      ),
      child: Slider(
        mouseCursor: MouseCursor.defer,
        value: currentValue,
        max: maxValue,
        divisions: 5,
        label: "rpogress",
        onChanged: (double value) {},
      ),
    );
  }
}
