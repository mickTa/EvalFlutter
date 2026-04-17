import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green_track/res/app_colors.dart';

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
  const WizardStepTransports({
    super.key,
    required this.onNext,
    required this.onBack,
  });

  final VoidCallback onNext;
  final VoidCallback onBack;

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
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
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
                      const Text("Passagers en moyenne :"),
                      Row(
                        children: [
                          FilledButton(onPressed: () {}, child: const Text("1")),
                          FilledButton(onPressed: () {}, child: const Text("2")),
                          FilledButton(onPressed: () {}, child: const Text("3")),
                          FilledButton(onPressed: () {}, child: const Text("4")),
                          FilledButton(onPressed: () {}, child: const Text("5+")),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        _BottomNavigationBar(
          onNext: widget.onNext,
          onBack: widget.onBack,
        ),
      ],
    );
  }
}
class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({required this.onNext, required this.onBack});

  final VoidCallback onNext;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(34, 64, 25, 0.1),
            blurRadius: 8,
            offset: Offset(0, 0),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: onBack,
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.primary,
                side: const BorderSide(color: AppColors.primary, width: 1.5),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              child: const Text(
                'Annuler',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: FilledButton(
              onPressed: onNext,
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              child: const Text(
                'Continuer',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}