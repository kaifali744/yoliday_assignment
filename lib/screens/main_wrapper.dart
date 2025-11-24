import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoliday_assignment/screens/portfolio_screen.dart';

import '../constants/app_colors.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _currentIndex = 1;

  //Empty scaffolds for pages
  final List<Widget> _pages = [
    const Scaffold(body: Center(child: Text("Home"))),
    const PortfolioScreen(),
    const Scaffold(body: Center(child: Text("Input"))),
    const Scaffold(body: Center(child: Text("Profile"))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        // height: 80.h,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Container(
            height: 70.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(0, "Home", "assets/icons/home.svg"),
                _buildNavItem(1, "Portfolio", "assets/icons/portfolio.svg"),
                _buildNavItem(2, "Input", "assets/icons/input.svg"),
                _buildNavItem(3, "Profile", "assets/icons/profile.svg"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String label, String iconPath) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Top Indicator Line
          Container(
            height: 2.h,
            width: 40.w,
            color: isSelected ? AppColors.primaryOrange : Colors.transparent,
          ),
          Spacer(),

          SvgPicture.asset(
            iconPath,
            color: isSelected ? AppColors.primaryOrange : AppColors.bottomGrey,
            height: 20.sp,
            width: 20.sp,
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? AppColors.primaryOrange : AppColors.bottomGrey,
              fontSize: 12.sp,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
