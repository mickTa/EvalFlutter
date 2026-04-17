import 'package:flutter/material.dart';
import 'package:green_track/res/app_colors.dart';
import 'package:green_track/res/app_icons.dart';

/// Widgets à utiliser :
/// - [FilledButton]
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
  bool _isMuscular = true;


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


                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(
                        AppIcons.car,
                        color: AppColors.primary,
                        size: 20,
                      ),
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

                      _DottedSlider(
                        value: _kmSlider,
                        max: _maxKm,
                        onChanged: (v) => setState(() => _kmSlider = v),
                      ),
                      const SizedBox(height: 16),

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

                          return SizedBox(
                            width: 43,
                            height: 43,
                            child: FilledButton(
                              onPressed: () => setState(() => _passagers = n),
                              style: FilledButton.styleFrom(
                                padding: EdgeInsets.zero,
                                backgroundColor: selected
                                    ? AppColors.secondary
                                    : AppColors.white,
                                foregroundColor: AppColors.primaryDark,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: selected
                                      ? const BorderSide(
                                    color: AppColors.primaryDark,
                                    width: 2,
                                  )
                                      : BorderSide.none,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  n == 5 ? '5+' : '$n',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'PlusJakartaSans',
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),


                const SizedBox(height: 24),


                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(
                        AppIcons.bike,
                        color: AppColors.primary,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'A vélo',
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
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => _isMuscular = true),
                              child: Container(
                                height: 41,
                                decoration: BoxDecoration(
                                  color: _isMuscular
                                      ? AppColors.secondary
                                      : AppColors.white,
                                  borderRadius: BorderRadius.circular(50),
                                  border: _isMuscular
                                      ? Border.all(
                                    color: AppColors.primaryDark,
                                    width: 2,
                                  )
                                      : null,
                                  boxShadow: _isMuscular
                                      ? null
                                      : [
                                    const BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.1),
                                      blurRadius: 2,
                                    ),
                                  ],
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'Musculaire',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'PlusJakartaSans',
                                    color: _isMuscular
                                        ? AppColors.primaryDark
                                        : AppColors.primary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => _isMuscular = false),
                              child: Container(
                                height: 41,
                                decoration: BoxDecoration(
                                  color: !_isMuscular
                                      ? AppColors.secondary
                                      : AppColors.white,
                                  borderRadius: BorderRadius.circular(50),
                                  border: !_isMuscular
                                      ? Border.all(
                                    color: AppColors.primaryDark,
                                    width: 2,
                                  )
                                      : null,
                                  boxShadow: !_isMuscular
                                      ? null
                                      : [
                                    const BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.1),
                                      blurRadius: 2,
                                    ),
                                  ],
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'Electrique',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'PlusJakartaSans',
                                    color: !_isMuscular
                                        ? AppColors.primaryDark
                                        : AppColors.primary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
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

                      _DottedSlider(
                        value: _kmSlider,
                        max: _maxKm,
                        onChanged: (v) => setState(() => _kmSlider = v),
                      ),
                      const SizedBox(height: 16),


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
        inactiveTrackColor: AppColors.secondary,
        thumbColor: AppColors.primaryDark,
        thumbShape: const RoundSliderThumbShape(),
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
    Offset? secondaryOffset,
    bool isDiscrete = false,
    bool isEnabled = false,
    double additionalActiveTrackHeight = 0,
  }) {
    final trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
    );

    final canvas = context.canvas;
    final centerY = trackRect.center.dy;

    final backgroundPaint = Paint()
      ..color = AppColors.white
      ..strokeWidth = 16
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      Offset(trackRect.left, centerY),
      Offset(trackRect.right, centerY),
      backgroundPaint,
    );

    final activePaint = Paint()
      ..color = AppColors.secondary
      ..strokeWidth = 16
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      Offset(thumbCenter.dx, centerY),
      Offset(trackRect.left, centerY),
      activePaint,
    );

    final dotPaint = Paint()..style = PaintingStyle.fill;
    final steps = (max / stepKm).round();

    for (int i = 0; i <= steps; i++) {
      final fraction = i * stepKm / max;
      final dx = trackRect.left + fraction * trackRect.width;

      dotPaint.color = AppColors.primary;

      canvas.drawCircle(Offset(dx, centerY), 2, dotPaint);
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
