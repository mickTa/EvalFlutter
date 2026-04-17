import 'package:flutter/material.dart';
import 'package:green_track/pages/shared/app_bar.dart';
import 'package:green_track/pages/wizard_page/step/wizard_step_housing.dart';
import 'package:green_track/pages/wizard_page/step/wizard_step_transports.dart';
import 'package:green_track/pages/wizard_page/step/wizard_step_consumption.dart';
import 'package:green_track/pages/results_page/results_page.dart';

class WizardPage extends StatefulWidget {
  const WizardPage({super.key});

  @override
  State<WizardPage> createState() => _WizardPageState();
}

class _WizardPageState extends State<WizardPage> {
  int _currentStep = 1;
  static const int _totalSteps = 3;

  void _nextStep() {
    if (_currentStep < _totalSteps) {
      setState(() => _currentStep++);
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const ResultsPage()),
      );
    }
  }

  void _previousStep() {
    if (_currentStep > 1) {
      setState(() => _currentStep--);
    }
  }

  Widget _buildStep() {
    switch (_currentStep) {
      case 1:
        return WizardStepTransports(onNext: _nextStep, onBack: _previousStep);
      case 2:
        return WizardStepHousing(onNext: _nextStep, onBack: _previousStep);
      case 3:
        return WizardStepConsumption(onNext: _nextStep, onBack: _previousStep);
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GreenTrackAppBar(
        bottom: WizardProgressBar(
          currentStep: _currentStep,
          totalSteps: _totalSteps,
        ),
      ),
      body: _buildStep(),
    );
  }
}