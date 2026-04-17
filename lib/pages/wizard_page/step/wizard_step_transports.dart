import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green_track/res/app_colors.dart';

/// Widgets à utiliser :
/// - [FilledButton]
class CustomSlider extends StatefulWidget {
  final double valeur;
  final double maxValeur;
  final Function(double) onChanged;

  const CustomSlider({
    super.key,
    required this.valeur,
    required this.maxValeur,
    required this.onChanged,
  });

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return Slider(
      min: 0.0,
      max: widget.maxValeur,
      value: widget.valeur,
      divisions: 100,
      onChanged: widget.onChanged,
    );
  }
}


class WizardStepTransports extends StatefulWidget {
  const WizardStepTransports({super.key});

  @override
  _WizardStepTransportsState createState() => _WizardStepTransportsState();
}

class _WizardStepTransportsState extends State<WizardStepTransports> {
  double _valeurSlider = 0.0;
  final double maxValeur = 15000;
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: "12000");
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Déplacements",
            style: TextStyle(
              color: AppColors.primaryDark,
              fontSize: 26,
              fontWeight: FontWeight.w900,
              height: 33 / 26,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(8),
            ),
            
            child: Column(
              children: [
                Text("Kilomètres/an : ${_valeurSlider.round()}"),
                CustomSlider(
                  valeur: _valeurSlider,
                  maxValeur: maxValeur,
                  onChanged: (double value) {
                    setState(() {
                      _valeurSlider = value;
                    });
                    
                  },
                ),
                Text("Passagers en moyenne :"),

                Row(children: [
                  FilledButton(onPressed: () {  }, child: Text("1")
                  ),
                  FilledButton(onPressed: () {  }, child: Text("2")),
                  FilledButton(onPressed: () {  }, child: Text("3")),
                  FilledButton(onPressed: () {  }, child: Text("4")),
                  FilledButton(onPressed: () {  }, child: Text("5+"))

                ],),
              ],
            ),
          ),
        ],
      ),
    );
  }
}