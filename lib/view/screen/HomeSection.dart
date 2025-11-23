import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:travelsystem/core/consta/Color.dart';
import 'package:travelsystem/controller/home_section_controller.dart';
import 'package:travelsystem/view/Widget/company_logo_widget.dart';
import 'package:travelsystem/view/Widget/info_card.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeSectionController());

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (child, animation) =>
                    FadeTransition(opacity: animation, child: child),
                child: controller.sliderImages.isNotEmpty
                    ? Column(
                  key: ValueKey('slider'),
                  children: [
                    _buildCarouselSlider(controller),
                    _buildSliderIndicator(controller),
                  ],
                )
                    : _buildAnimatedPlaceholder(height: 170, text: 'جاري تحميل العروض...'),
              ),

          const SizedBox(height: 16),
          _buildSectionTitle('الشركات المعتمدة'),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (child, animation) =>
                    SlideTransition(
                      position: Tween<Offset>(begin: const Offset(1,0), end: Offset.zero).animate(animation),
                      child: child,
                    ),
                child: controller.companyLogos.isNotEmpty
                    ? _buildCompanyLogos(controller)
                    : _buildAnimatedPlaceholder(height: 70, text: 'جاري تحميل الشركات...'),
              ),

          const SizedBox(height: 16),
          _buildSectionTitle('خدمات أخرى'),
          _buildInfoCards(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  // Slider offers with Hero animation if needed in future navigation
  Widget _buildCarouselSlider(HomeSectionController controller) {
    return Card(
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.1),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: CarouselSlider.builder(
        itemCount: controller.sliderImages.length,
        itemBuilder: (context, index, realIndex) {
          final img = controller.sliderImages[index];
          return Hero(
            tag: 'slider_img_$index',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(img, fit: BoxFit.cover, width: double.infinity),
            ),
          );
        },
        options: CarouselOptions(
          height: 170,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 4),
          enlargeCenterPage: true,
          onPageChanged: (index, reason) => controller.onSliderPageChanged(index),
        ),
      ),
    );
  }

  // Slider Indicator with AnimatedContainer for circles
  Widget _buildSliderIndicator(HomeSectionController controller) {
    return Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(controller.sliderImages.length, (idx) {
        bool isActive = controller.currentSliderIndex.value == idx;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: isActive ? 24 : 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          decoration: BoxDecoration(
            color: isActive ? AppColor.color_primary : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(12),
            boxShadow: isActive ? [BoxShadow(color: AppColor.color_primary.withOpacity(0.3), blurRadius: 4)] : [],
          ),
        );
      }),
    ));
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Text(
        title,
        style: TextStyle(color: AppColor.color_primary, fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Cairo'),
      ),
    );
  }

  Widget _buildCompanyLogos(HomeSectionController controller) {
    return SizedBox(
      height: 70,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        physics: const BouncingScrollPhysics(),
        itemCount: controller.companyLogos.length,
        itemBuilder: (context, index) =>
            FadeInLogoWidget(imageUrl: controller.companyLogos[index], duration: 400 + index*50),
        separatorBuilder: (context, index) => const SizedBox(width: 16),
      ),
    );
  }

  // Info cards with animation on tap
  Widget _buildInfoCards() {
    final infoList = [
      {'title': 'الأسئلة الشائعة', 'icon': Icons.help_outline_rounded, 'onTap': () {}},
      {'title': 'سياسات الشركات', 'icon': Icons.policy_outlined, 'onTap': () {}},
      {'title': 'التواصل والدعم', 'icon': Icons.support_agent, 'onTap': () {}},
      {'title': 'معلومات التطبيق', 'icon': Icons.info_outline, 'onTap': () {}},
    ];

    return Row(
      children: infoList.map((item) => Expanded(
        child: AnimatedScale(
          scale: 1.0,
          duration: const Duration(milliseconds: 400),
          child: InfoCard(
            title: item['title'] as String,
            icon: item['icon'] as IconData,
            onTap: item['onTap'] as void Function(),
          ),
        ),
      )).toList(),
    );
  }
  // Animated loader/placeholder
  Widget _buildAnimatedPlaceholder({required double height, required String text}) {
    return Container(
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 1, end: 0.4),
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              builder: (context, value, child) {
                return Opacity(
                  opacity: value,
                  child: CircularProgressIndicator(color: AppColor.color_primary),
                );
              },
              onEnd: () {}, // optional
            ),
            const SizedBox(height: 12),
            Text(text, style: TextStyle(color: Colors.grey.shade600, fontFamily: 'Cairo')),
          ],
        ),
      ),
    );
  }
}

// Widget لشعار الشركة مع Fade effect عند الظهور
class FadeInLogoWidget extends StatelessWidget {
  final String imageUrl;
  final int duration;
  const FadeInLogoWidget({required this.imageUrl, this.duration = 400, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1,
      duration: Duration(milliseconds: duration),
      child: CompanyLogoWidget(imageUrl: imageUrl),
    );
  }
}
