import 'package:flutter/material.dart';
import 'package:green_track/res/app_colors.dart';
import 'package:green_track/res/app_icons.dart';


/// Widgets à utiliser :
/// - [FilledButton]
/// - [TextField]
  /// - [RadioGroup] avec [Radio] (regarder la doc de [RadioListTile])
enum ChauffageType { bois, gaz, electrique }
class WizardStepHousing extends StatefulWidget {
  const WizardStepHousing({
    super.key,
    required this.onNext,
    required this.onBack,
  });

  final VoidCallback onNext;
  final VoidCallback onBack;

  @override
  State<WizardStepHousing> createState() => _WizardStepHousingState();
}

class _WizardStepHousingState extends State<WizardStepHousing> {
  bool _isAppartement = true;
  ChauffageType? _chauffage;

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
                  "Logement principal",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primaryDark,
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
                        AppIcons.house,
                        color: AppColors.primary,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Caractéristiques : ',
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
                      const Text(
                        'Type :',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'PlusJakartaSans',
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => _isAppartement = true),
                              child: Container(
                                height: 41,
                                decoration: BoxDecoration(
                                  color: _isAppartement
                                      ? AppColors.secondary
                                      : AppColors.white,
                                  borderRadius: BorderRadius.circular(50),
                                  border: _isAppartement
                                      ? Border.all(
                                          color: AppColors.primaryDark,
                                          width: 2,
                                        )
                                      : null,
                                  boxShadow: _isAppartement
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
                                  'Appartement',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'PlusJakartaSans',
                                    color: _isAppartement
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
                              onTap: () => setState(() => _isAppartement = false),
                              child: Container(
                                height: 41,
                                decoration: BoxDecoration(
                                  color: !_isAppartement
                                      ? AppColors.secondary
                                      : AppColors.white,
                                  borderRadius: BorderRadius.circular(50),
                                  border: !_isAppartement
                                      ? Border.all(
                                          color: AppColors.primaryDark,
                                          width: 2,
                                        )
                                      : null,
                                  boxShadow: !_isAppartement
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
                                  'Maison',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'PlusJakartaSans',
                                    color: !_isAppartement
                                        ? AppColors.primaryDark
                                        : AppColors.primary,
                                  ),
                                  
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      const Text(
                        'Surface (m2) :',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'PlusJakartaSans',
                          color: AppColors.primary,
                        ),
                        
                      ),
                      const SizedBox(height: 12),

                      TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          AppIcons.squareFoot,
                          color: AppColors.primary,
                        ),
                        hintText: 'Ex : 30',
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),

                        suffixIcon: const Padding(
                          padding: EdgeInsets.only(right: 16),
                          child: Align(
                            alignment: Alignment.centerRight,
                            widthFactor: 1,
                            child: Text(
                              'm2',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryDark,
                              ),
                            ),
                          ),
                        ),
                        suffixIconConstraints: const BoxConstraints(
                          minWidth: 0,
                          minHeight: 0,
                        ),

                        filled: true,
                        fillColor: AppColors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 16,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Colors.transparent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            color: AppColors.primary,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
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
                        AppIcons.heating,
                        color: AppColors.primary,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Source de chauffage : ',
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
                      const Text(
                        'Type :',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'PlusJakartaSans',
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () => setState(() => _chauffage = ChauffageType.bois ),
                            child: Container(
                              height: 41,
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                color: _chauffage == ChauffageType.bois
                                    ? AppColors.secondary
                                    : AppColors.white,
                                borderRadius: BorderRadius.circular(50),
                                border: _chauffage == ChauffageType.bois
                                    ? Border.all(
                                  color: AppColors.primaryDark,
                                  width: 2,
                                )
                                    : null,
                                boxShadow: _chauffage == ChauffageType.bois
                                    ? null
                                    : [
                                  const BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.1),
                                    blurRadius: 2,
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Text(
                                    'Bois',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'PlusJakartaSans',
                                      color: _chauffage == ChauffageType.bois
                                          ? AppColors.primaryDark
                                          : AppColors.primary,
                                    ),
                                  ),

                                  if (_chauffage == ChauffageType.bois)
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryDark,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.check,
                                        size: 14,
                                        color: Colors.white,
                                      ),
                                    )
                                  else
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColors.primary,
                                          width: 2,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          GestureDetector(
                            onTap: () => setState(() => _chauffage == ChauffageType.gaz),
                            child: Container(
                              height: 41,
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                color:  _chauffage == ChauffageType.gaz
                                    ? AppColors.secondary
                                    : AppColors.white,
                                borderRadius: BorderRadius.circular(50),
                                border:  _chauffage == ChauffageType.gaz
                                    ? Border.all(
                                  color: AppColors.primaryDark,
                                  width: 2,
                                )
                                    : null,
                                boxShadow:  _chauffage == ChauffageType.gaz
                                    ? null
                                    : [
                                  const BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.1),
                                    blurRadius: 2,
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Text(
                                    'Gaz',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'PlusJakartaSans',
                                      color:  _chauffage == ChauffageType.gaz
                                          ? AppColors.primaryDark
                                          : AppColors.primary,
                                    ),
                                  ),

                                  if ( _chauffage == ChauffageType.gaz)
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryDark,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.check,
                                        size: 14,
                                        color: Colors.white,
                                      ),
                                    )
                                  else
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColors.primary,
                                          width: 2,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          GestureDetector(
                            onTap: () => setState(() =>  _chauffage == ChauffageType.electrique),
                            child: Container(
                              height: 41,
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                color: _chauffage == ChauffageType.electrique
                                    ? AppColors.secondary
                                    : AppColors.white,
                                borderRadius: BorderRadius.circular(50),
                                border: _chauffage == ChauffageType.electrique
                                    ? Border.all(
                                  color: AppColors.primaryDark,
                                  width: 2,
                                )
                                    : null,
                                boxShadow: _chauffage == ChauffageType.electrique
                                    ? null
                                    : [
                                  const BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.1),
                                    blurRadius: 2,
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Text(
                                    'Electrique',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'PlusJakartaSans',
                                      color: _chauffage == ChauffageType.electrique
                                          ? AppColors.primaryDark
                                          : AppColors.primary,
                                    ),
                                  ),

                                  if (_chauffage == ChauffageType.electrique)
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryDark,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.check,
                                        size: 14,
                                        color: Colors.white,
                                      ),
                                    )
                                  else
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColors.primary,
                                          width: 2,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
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