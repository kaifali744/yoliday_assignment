import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import '../model/project_model.dart';
import '../widgets/project_card.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();

  final InputBorder searchBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.r),
    borderSide: BorderSide(
      color: AppColors.cardBorder,
      width: 1.w,
    ),
  );

  final List<ProjectModel> _allProjects = [
    ProjectModel(
        imagePath: 'assets/images/img1.jpg',
        title: 'Kemampuan Merangkum\nTulisan',
        subtitle: 'BAHASA SUNDA',
        author: 'Al-Baiqi Samaan',
        rating: 'A'),
    ProjectModel(
        imagePath: 'assets/images/img2.jpg',
        title: 'Kemampuan Merangkum\nTulisan',
        subtitle: 'BAHASA SUNDA',
        author: 'Al-Baiqi Samaan',
        rating: 'A'),
    ProjectModel(
        imagePath: 'assets/images/img3.jpg',
        title: 'Kemampuan Merangkum\nTulisan',
        subtitle: 'BAHASA SUNDA',
        author: 'Al-Baiqi Samaan',
        rating: 'A'),
    ProjectModel(
        imagePath: 'assets/images/img4.jpg',
        title: 'Kemampuan Merangkum\nTulisan',
        subtitle: 'BAHASA SUNDA',
        author: 'Al-Baiqi Samaan',
        rating: 'A'),
    ProjectModel(
        imagePath: 'assets/images/img5.jpg',
        title: 'Kemampuan Merangkum\nTulisan',
        subtitle: 'BAHASA SUNDA',
        author: 'Al-Baiqi Samaan',
        rating: 'A'),
  ];

  List<ProjectModel> _filteredProjects = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _filteredProjects = _allProjects;
  }

  // Search filtering logic
  void _filterProjects(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredProjects = _allProjects;
      } else {
        _filteredProjects = _allProjects
            .where((project) =>
            project.title.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Portfolio",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_bag, color: AppColors.primaryOrange)),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications, color: AppColors.primaryOrange)),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColors.primaryOrange,
          unselectedLabelColor: AppColors.textBlack,
          indicatorColor: AppColors.primaryOrange,
          indicatorSize: TabBarIndicatorSize.label,
          isScrollable: true,
          tabAlignment: TabAlignment.center,
          labelPadding: EdgeInsets.symmetric(horizontal: 18.w),
          labelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
          tabs: const [
            Tab(text: "Project"),
            Tab(text: "Saved"),
            Tab(text: "Shared"),
            Tab(text: "Achievement"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Project Tab (The Main UI)
          _buildProjectContent(),
          // Empty Containers for other tabs
          Container(),
          Container(),
          Container(),
        ],
      ),
    );
  }
  Widget _buildProjectContent() {
    return Stack(
      children: [
        Column(
          children: [
            // Search Bar
            Padding(
              padding: EdgeInsets.all(16.w),
              child: TextField(
                controller: _searchController,
                onChanged: _filterProjects,
                decoration: InputDecoration(
                  hintText: "Search a project",
                  hintStyle: TextStyle(color: AppColors.textGrey, fontSize: 14.sp, fontWeight: FontWeight.w400),
                  fillColor: Colors.white,
                  filled: true,
                  suffixIcon: Container(
                    margin: EdgeInsets.all(6.w),
                    decoration: BoxDecoration(
                      color: AppColors.primaryOrange,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Icon(Icons.search, color: Colors.white, size: 24.sp),
                  ),
                  border: searchBorder,
                  enabledBorder: searchBorder,
                  focusedBorder: searchBorder,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                ),
              ),
            ),
            // List of Cards
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                itemCount: _filteredProjects.length,
                itemBuilder: (context, index) {
                  //Extra padding at bottom so the Filter button doesn't cover the last item
                  if (index == _filteredProjects.length - 1) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 80.h),
                      child: ProjectCard(projectModel: _filteredProjects[index]),
                    );
                  }
                  return ProjectCard(projectModel: _filteredProjects[index]);
                },
              ),
            ),
          ],
        ),

        //Filter Button (Appearance only)
        Positioned(
          bottom: 20.h,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: AppColors.primaryOrange,
                borderRadius: BorderRadius.circular(50.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryOrange.withOpacity(0.25),
                    blurRadius: 15,
                    offset: const Offset(0, 0),
                  )
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.filter_list, color: Colors.white, size: 24.sp),
                  SizedBox(width: 8.w),
                  Text(
                    "Filter",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
