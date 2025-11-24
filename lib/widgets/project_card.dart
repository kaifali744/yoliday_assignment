import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoliday_assignment/constants/app_colors.dart';

import '../model/project_model.dart';

class ProjectCard extends StatelessWidget {
  final ProjectModel projectModel;
  const ProjectCard({super.key, required this.projectModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: AppColors.cardBorder,
          width: 1.w,
          style: BorderStyle.solid,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          //Image
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r),
              bottomLeft: Radius.circular(10.r),
            ),
            child: Image.asset(
              projectModel.imagePath,
              width: 110.w,
              height: 110.h,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 110.w,
                height: 110.h,
                color: Colors.grey,
                child: Icon(Icons.image, color: Colors.grey),
              ),
            ),
          ),
          SizedBox(width: 16.w),
          //Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    projectModel.title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textBlack,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            projectModel.subtitle,
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textBlack,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Oleh ",
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: AppColors.textGrey,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                projectModel.author,
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: AppColors.textGrey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    //Rating
                    Container(
                      margin: EdgeInsets.only(right: 16.w),
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 5.h,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            AppColors.gradientOrange,
                            AppColors.gradientYellow,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Text(
                        projectModel.rating,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
