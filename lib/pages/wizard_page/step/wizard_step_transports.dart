import 'package:flutter/material.dart';
import 'package:green_track/res/app_colors.dart';
import 'package:green_track/res/app_icons.dart';

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
  double _kmSlider = 12000;
  int _passagers = 1;
  final double _maxKm = 12000;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Déplacements",
                  style: TextStyle(
                    color: AppColors.primaryDark,
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 24),

                // Section En voiture
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(AppIcons.car, color: AppColors.primary, size: 20),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'En voiture',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'PlusJakartaSans',
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Card voiture
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Kilomètres/an header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Kilomètres / an :',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'PlusJakartaSans',
                              color: AppColors.primary,
                            ),
                          ),
                          Text(
                            '${_kmSlider.round()} km',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'PlusJakartaSans',
                              color: AppColors.primaryDark,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      // Slider avec pointillés
                      _DottedSlider(
                        value: _kmSlider,
                        max: _maxKm,
                        onChanged: (v) => setState(() => _kmSlider = v),
                      ),
                      const SizedBox(height: 16),

                      // Passagers
                      const Text(
                        'Passagers en moyenne :',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'PlusJakartaSans',
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [1, 2, 3, 4, 5].map((n) {
                          final selected = _passagers == n;
                          return GestureDetector(
                            onTap: () => setState(() => _passagers = n),
                            child: Container(
                              width: 43,
                              height: 43,
                              decoration: BoxDecoration(
                                color: selected ? AppColors.secondary : AppColors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: selected
                                    ? Border.all(color: AppColors.primaryDark, width: 2)
                                    : null,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                n == 5 ? '5+' : '$n',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'PlusJakartaSans',
                                  color: selected ? AppColors.primaryDark : AppColors.primary,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        _BottomNavigationBar(onNext: widget.onNext, onBack: widget.onBack),
      ],
    );
  }
}

class _DottedSlider extends StatelessWidget {
  final double value;
  final double max;
  final ValueChanged<double> onChanged;

  const _DottedSlider({
    required this.value,
    required this.max,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 3,
        activeTrackColor: AppColors.primary,
        inactiveTrackColor: Colors.transparent,
        thumbColor: AppColors.primaryDark,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
        overlayColor: AppColors.secondary.withOpacity(0.3),
        trackShape: _DottedTrackShape(max: max, stepKm: 1000),
      ),
      child: Slider(
        min: 0,
        max: max,
        value: value,
        divisions: 150,
        onChanged: onChanged,
      ),
    );
  }
}

class _DottedTrackShape extends SliderTrackShape with BaseSliderTrackShape {
  final double max;
  final double stepKm;

  const _DottedTrackShape({required this.max, required this.stepKm});

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required TextDirection textDirection,
    required Offset thumbCenter,
    Offset? secondaryOffset, // ✅ FIX AJOUTÉ ICI
    bool isDiscrete = false,
    bool isEnabled = false,
    double additionalActiveTrackHeight = 0,
  }) {
    final trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
    );

    final activePaint = Paint()
      ..color = sliderTheme.activeTrackColor!
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // Ligne active
    context.canvas.drawLine(
      Offset(trackRect.left, trackRect.center.dy),
      Offset(thumbCenter.dx, trackRect.center.dy),
      activePaint,
    );

    // Points tous les 1000 km
    final dotPaint = Paint()..style = PaintingStyle.fill;
    final steps = (max / stepKm).round();

    for (int i = 0; i <= steps; i++) {
      final fraction = i * stepKm / max;
      final dx = trackRect.left + fraction * trackRect.width;
      final isActive = dx <= thumbCenter.dx;

      dotPaint.color = isActive ? AppColors.primary : AppColors.disabled;
      context.canvas.drawCircle(
        Offset(dx, trackRect.center.dy),
        isActive ? 4 : 3,
        dotPaint,
      );
    }
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
                'Retour',
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