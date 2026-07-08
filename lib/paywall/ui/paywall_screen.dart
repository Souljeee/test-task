import 'package:flutter/material.dart';
import 'package:test_task/core/theme/app_colors.dart';
import 'package:test_task/paywall/ui/success_payment_bottom_sheet.dart';

enum _Plan { monthly, yearly }

class PaywallScreen extends StatefulWidget {
  const PaywallScreen({super.key});

  @override
  State<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends State<PaywallScreen> {
  _Plan _selected = _Plan.yearly;
  bool _isLoading = false;

  Future<void> _onContinue() async {
    setState(() => _isLoading = true);
    // Эмуляция покупки
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    setState(() => _isLoading = false);
    // TODO: сохранить подписку и перейти на главный экран
    _showSuccessSheet();
  }

  void _showSuccessSheet() {
    SuccessPaymentBottomSheet.show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _Header(),
            const SizedBox(height: 8),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    _PlanSelector(
                      selected: _selected,
                      onChanged: (plan) => setState(() => _selected = plan),
                    ),
                    const SizedBox(height: 12),
                    _TrialNote(plan: _selected),
                    const SizedBox(height: 28),
                    const _FeatureList(),
                    const SizedBox(height: 28),
                  ],
                ),
              ),
            ),
            _BottomAction(
              plan: _selected,
              isLoading: _isLoading,
              onContinue: _onContinue,
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Header
// ---------------------------------------------------------------------------

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 12),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: AppColors.surface,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.border, width: 1.5),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.accentGlow,
                  blurRadius: 32,
                  spreadRadius: 4,
                ),
              ],
            ),
            child: const Icon(
              Icons.workspace_premium_rounded,
              color: AppColors.accent,
              size: 32,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Полный доступ',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 26,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Выберите удобный план подписки',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Feature list
// ---------------------------------------------------------------------------

class _FeatureList extends StatelessWidget {
  const _FeatureList();

  static const List<(IconData, String)> _features = [
    (Icons.all_inclusive_rounded, 'Неограниченный доступ к контенту'),
    (Icons.bolt_rounded, 'Моментальные обновления'),
    (Icons.block_rounded, 'Без рекламы'),
    (Icons.support_agent_rounded, 'Приоритетная поддержка'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: _features.indexed.map((entry) {
          final (index, feature) = entry;
          final (icon, label) = feature;

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: AppColors.accentGlow,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(icon, color: AppColors.accent, size: 18),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        label,
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (index < _features.length - 1)
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: AppColors.border,
                  indent: 20,
                  endIndent: 20,
                ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Plan selector
// ---------------------------------------------------------------------------

class _PlanSelector extends StatelessWidget {
  const _PlanSelector({required this.selected, required this.onChanged});

  final _Plan selected;
  final ValueChanged<_Plan> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _PlanCard(
          plan: _Plan.yearly,
          selected: selected == _Plan.yearly,
          title: 'Год',
          price: '1 990 ₽ / год',
          priceMonthly: '166 ₽ / мес',
          badge: 'Выгода 44%',
          onTap: () => onChanged(_Plan.yearly),
        ),
        const SizedBox(height: 12),
        _PlanCard(
          plan: _Plan.monthly,
          selected: selected == _Plan.monthly,
          title: 'Месяц',
          price: '299 ₽ / мес',
          priceMonthly: null,
          badge: null,
          onTap: () => onChanged(_Plan.monthly),
        ),
      ],
    );
  }
}

class _PlanCard extends StatelessWidget {
  const _PlanCard({
    required this.plan,
    required this.selected,
    required this.title,
    required this.price,
    required this.priceMonthly,
    required this.badge,
    required this.onTap,
  });

  final _Plan plan;
  final bool selected;
  final String title;
  final String price;
  final String? priceMonthly;
  final String? badge;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        decoration: BoxDecoration(
          color: selected ? AppColors.accentGlow : AppColors.surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: selected ? AppColors.accent : AppColors.border,
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selected ? AppColors.accent : Colors.transparent,
                border: Border.all(
                  color: selected ? AppColors.accent : AppColors.textDisabled,
                  width: 2,
                ),
              ),
              child: selected
                  ? const Icon(Icons.check, size: 14, color: AppColors.background)
                  : null,
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: selected ? AppColors.accent : AppColors.textPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (priceMonthly != null)
                    Text(
                      priceMonthly!,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                      ),
                    ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  price,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (badge != null)
                  const SizedBox(height: 4),
                if (badge != null)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppColors.accent,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      badge!,
                      style: const TextStyle(
                        color: AppColors.background,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Trial note
// ---------------------------------------------------------------------------

class _TrialNote extends StatelessWidget {
  const _TrialNote({required this.plan});

  final _Plan plan;

  @override
  Widget build(BuildContext context) {
    final text = plan == _Plan.yearly
        ? 'Списание раз в год. Отмена в любое время.'
        : 'Списание ежемесячно. Отмена в любое время.';

    return Text(
      text,
      style: const TextStyle(
        color: AppColors.textDisabled,
        fontSize: 12,
        height: 1.5,
      ),
      textAlign: TextAlign.center,
    );
  }
}

// ---------------------------------------------------------------------------
// Bottom action
// ---------------------------------------------------------------------------

class _BottomAction extends StatelessWidget {
  const _BottomAction({
    required this.plan,
    required this.isLoading,
    required this.onContinue,
  });

  final _Plan plan;
  final bool isLoading;
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
      decoration: const BoxDecoration(
        color: AppColors.background,
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.infinity,
            height: 56,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: isLoading
                    ? null
                    : const LinearGradient(
                        colors: [AppColors.accent, AppColors.accentDim],
                      ),
                color: isLoading ? AppColors.surface : null,
                borderRadius: BorderRadius.circular(16),
                boxShadow: isLoading
                    ? null
                    : const [
                        BoxShadow(
                          color: AppColors.accentGlow,
                          blurRadius: 24,
                          offset: Offset(0, 8),
                        ),
                      ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: isLoading ? null : onContinue,
                  borderRadius: BorderRadius.circular(16),
                  child: Center(
                    child: isLoading
                        ? const SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.5,
                              color: AppColors.accent,
                            ),
                          )
                        : const Text(
                            'Продолжить',
                            style: TextStyle(
                              color: AppColors.background,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.2,
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
