import 'package:flutter/material.dart';
import 'package:green_track/l10n/app_localizations.dart';
import 'package:green_track/res/app_colors.dart';
import 'package:green_track/res/app_icons.dart';
class WizardProgressBar extends StatelessWidget implements PreferredSizeWidget {
  const WizardProgressBar({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  final int currentStep;
  final int totalSteps;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondary,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'ÉTAPE $currentStep SUR $totalSteps',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w900,
              fontFamily: 'PlusJakartaSans',
              color: AppColors.primaryDark, // #224019
              letterSpacing: 0,
            ),
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(200),
            child: LinearProgressIndicator(
              value: currentStep / totalSteps,
              backgroundColor: Colors.white, // rgba(255,255,255,1)
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
              minHeight: 12, // height: 12px
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class GreenTrackAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GreenTrackAppBar({super.key, this.bottom});

  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        spacing: 14.0,
        children: <Widget>[
          Icon(AppIcons.app, size: 20.0),
          Expanded(
            child: Text(
              AppLocalizations.of(context)!.app_name,
              style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w900),
            ),
          ),
        ],
      ),
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));
}