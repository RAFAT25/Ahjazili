import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelsystem/core/consta/Color.dart';
import 'package:travelsystem/core/consta/dimensions.dart';
import 'package:travelsystem/core/consta/nameRoute.dart';
import '../../controller/auth/AuthService.dart';
import '../../core/Function/showLogoutDialog.dart';
import '../Widget/language_bottom_sheet.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Get.find<AuthService>();
    final userName = authService.userName ?? "زائر";
    final userEmail = authService.userEmail ?? "لا يوجد بريد إلكتروني";

    final quickActions = [
      _HomeAction(
        icon: Icons.language,
        title: 'اللغة',
        subtitle: 'تغيير لغة التطبيق',
        background: AppColor.primary.withOpacity(0.15),
        onTap: () => showLanguageBottomSheet(),
      ),
      _HomeAction(
        icon: Icons.support_agent,
        title: 'الدعم والمساعدة',
        subtitle: 'تواصل مع فريقنا',
        background: AppColor.accent.withOpacity(0.2),
        onTap: () => Get.toNamed(AppRoute.SupportAndHelp),
      ),
      _HomeAction(
        icon: Icons.notifications_active_outlined,
        title: 'الإشعارات',
        subtitle: 'إعداد التفضيلات',
        background: AppColor.success.withOpacity(0.18),
        onTap: () => Get.toNamed(AppRoute.notification),
      ),
      _HomeAction(
        icon: Icons.info_outline,
        title: 'عن التطبيق',
        subtitle: 'تعرف علينا أكثر',
        background: AppColor.warning.withOpacity(0.18),
        onTap: () => Get.toNamed(AppRoute.AboutApp),
      ),
    ];

    final helpCards = [
      _HomeAction(
        icon: Icons.question_answer,
        title: 'الأسئلة الشائعة',
        subtitle: 'أجوبة جاهزة وسريعة',
        background: Colors.white,
        onTap: () => Get.toNamed(AppRoute.SupportAndHelp),
      ),
      _HomeAction(
        icon: Icons.logout_rounded,
        title: 'تسجيل الخروج',
        subtitle: 'تسجيل خروج آمن',
        background: Colors.white,
        onTap: () => showLogoutDialog(context),
      ),
    ];

    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingMedium,
                  vertical: AppDimensions.paddingMedium,
                ),
                child: _UserHeroCard(
                  userName: userName,
                  email: userEmail,
                  isGuest: authService.isGuest,
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingMedium,
                vertical: AppDimensions.paddingSmall,
              ),
              sliver: SliverToBoxAdapter(
                child: _SectionHeader(title: 'إجراءات سريعة'),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingMedium,
              ),
              sliver: SliverToBoxAdapter(
                child: Wrap(
                  spacing: AppDimensions.spacingSmall,
                  runSpacing: AppDimensions.spacingSmall,
                  children: quickActions
                      .map((action) => _ActionCard(action: action))
                      .toList(),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingMedium,
                vertical: AppDimensions.paddingLarge,
              ),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _SectionHeader(title: 'مركز المساعدة'),
                    SizedBox(height: AppDimensions.spacingSmall),
                    ...helpCards
                        .map((action) => _ActionCard(
                              action: action,
                              isFullWidth: true,
                            ))
                        .toList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;

  const _SectionHeader({required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.headline.copyWith(fontSize: 20),
        ),
        if (subtitle != null) ...[
          SizedBox(height: AppDimensions.spacingXSmall),
          Text(
            subtitle!,
            style: AppTextStyles.body,
          ),
        ],
      ],
    );
  }
}

class _UserHeroCard extends StatelessWidget {
  final String userName;
  final String email;
  final bool isGuest;

  const _UserHeroCard({
    required this.userName,
    required this.email,
    required this.isGuest,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimensions.paddingLarge),
      decoration: BoxDecoration(
        gradient: AppGradients.primaryGradient,
        borderRadius: BorderRadius.circular(AppDimensions.radiusXLarge),
        boxShadow: [
          BoxShadow(
            color: AppColor.primary.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'مرحباً 👋',
            style: AppTextStyles.subtitle.copyWith(
              color: AppColor.surface.withOpacity(0.8),
            ),
          ),
          SizedBox(height: AppDimensions.spacingXSmall),
          Text(
            userName,
            style: AppTextStyles.headline.copyWith(
              color: AppColor.surface,
              fontSize: 26,
            ),
          ),
          SizedBox(height: AppDimensions.spacingSmall),
          Row(
            children: [
              Icon(Icons.email_outlined, color: AppColor.surface, size: 18),
              SizedBox(width: AppDimensions.spacingXSmall),
              Expanded(
                child: Text(
                  email,
                  style: AppTextStyles.body.copyWith(
                    color: AppColor.surface.withOpacity(0.9),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: AppDimensions.spacingLarge),
          Row(
            children: [
              _HeroChip(
                icon: Icons.star_rounded,
                label: isGuest ? 'وضع الضيف' : 'مستخدم موثق',
              ),
              SizedBox(width: AppDimensions.spacingSmall),
              _HeroChip(
                icon: Icons.directions_bus_filled_outlined,
                label: 'إدارة الحجوزات',
                onTap: () => Get.toNamed(AppRoute.Reservations),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeroChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const _HeroChip({
    required this.icon,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final chip = Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingMedium,
        vertical: AppDimensions.paddingSmall,
      ),
      decoration: BoxDecoration(
        color: AppColor.surface.withOpacity(0.15),
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColor.surface, size: 18),
          SizedBox(width: AppDimensions.spacingXSmall),
          Text(
            label,
            style: AppTextStyles.body.copyWith(
              color: AppColor.surface,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
        child: chip,
      );
    }
    return chip;
  }
}

class _ActionCard extends StatelessWidget {
  final _HomeAction action;
  final bool isFullWidth;

  const _ActionCard({required this.action, this.isFullWidth = false});

  @override
  Widget build(BuildContext context) {
    final card = Container(
      width: isFullWidth
          ? double.infinity
          : (MediaQuery.of(context).size.width -
                  (AppDimensions.paddingMedium * 2) -
                  AppDimensions.spacingSmall) /
              2,
      padding: EdgeInsets.all(AppDimensions.paddingMedium),
      decoration: BoxDecoration(
        color: action.background,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
        border: Border.all(
          color: Colors.white.withOpacity(0.6),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(AppDimensions.paddingSmall),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Icon(
              action.icon,
              color: AppColor.primary,
            ),
          ),
          SizedBox(height: AppDimensions.spacingSmall),
          Text(
            action.title,
            style: AppTextStyles.headline.copyWith(
              fontSize: 18,
            ),
          ),
          SizedBox(height: AppDimensions.spacingXSmall),
          Text(
            action.subtitle,
            style: AppTextStyles.body,
          ),
        ],
      ),
    );

    return InkWell(
      onTap: action.onTap,
      borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
      child: card,
    );
  }
}

class _HomeAction {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color background;
  final VoidCallback onTap;

  const _HomeAction({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.background,
    required this.onTap,
  });
}
