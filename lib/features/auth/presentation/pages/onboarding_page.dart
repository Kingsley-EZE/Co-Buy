import 'package:co_buy/core/components/atoms/app_button.dart';
import 'package:co_buy/core/components/scaffolds/app_scaffold.dart';
import 'package:co_buy/core/design_system/design_system.dart';
import 'package:co_buy/core/navigation/routes.dart';
import 'package:co_buy/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class _OnboardingStep {
  const _OnboardingStep({
    required this.title,
    required this.subtitle,
    required this.illustration,
    this.illustrationTopPadding = AppSpacing.s16,
  });

  final String title;
  final String subtitle;
  final AssetGenImage illustration;

  /// Gap between the step indicator and the illustration — per step, since
  /// the assets carry different amounts of built-in padding.
  final double illustrationTopPadding;
}

final _steps = <_OnboardingStep>[
  _OnboardingStep(
    title: 'Pool Together,\nAchieve More',
    subtitle:
        'Combine funds with your neighbours for the things everyone needs.',
    illustration: Assets.images.imgOnboardOne,
  ),
  _OnboardingStep(
    title: 'Watch Your\nGoal Come Alive',
    subtitle: 'See contributions add up in real time, right on your screen.',
    illustration: Assets.images.imgOnboardTwo,
    illustrationTopPadding: AppSpacing.s40,
  ),
  _OnboardingStep(
    title: 'Every Voice Counts\nToward Something',
    subtitle: 'Join the people around you already working toward shared goals.',
    illustration: Assets.images.imgOnboardThree,
  ),
];

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _pageController = PageController();
  int _currentIndex = 0;

  bool get _isLastStep => _currentIndex == _steps.length - 1;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onButtonPressed() {
    if (_isLastStep) {
      const LoginRoute().go(context);
      return;
    }
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.screenH,
              vertical: AppSpacing.s16,
            ),
            child: _StepIndicator(currentIndex: _currentIndex),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _steps.length,
              onPageChanged: (index) => setState(() => _currentIndex = index),
              itemBuilder: (context, index) => _StepContent(_steps[index]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.screenH,
              AppSpacing.s16,
              AppSpacing.screenH,
              AppSpacing.s24,
            ),
            child: AppButton(
              label: _isLastStep ? 'Get started' : 'Next',
              onPressed: _onButtonPressed,
            ),
          ),
        ],
      ),
    );
  }
}

class _StepIndicator extends StatelessWidget {
  const _StepIndicator({required this.currentIndex});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppSpacing.s8,
      children: [
        for (var i = 0; i < _steps.length; i++)
          Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: AppSpacing.s8,
              decoration: BoxDecoration(
                color: i <= currentIndex
                    ? context.colors.button.primary
                    : context.colors.bg.tertiary,
                borderRadius: AppRadius.brFull,
              ),
            ),
          ),
      ],
    );
  }
}

class _StepContent extends StatelessWidget {
  const _StepContent(this.step);

  final _OnboardingStep step;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenH),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: step.illustrationTopPadding),
              child: FractionallySizedBox(
                alignment: Alignment.topCenter,
                heightFactor: 0.75,
                child: step.illustration.image(fit: BoxFit.contain),
              ),
            ),
          ),
          Text(
            step.title,
            style: context.styles.h4,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.s12),
          Text(
            step.subtitle,
            style: context.styles.bodyM,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.s24),
        ],
      ),
    );
  }
}
