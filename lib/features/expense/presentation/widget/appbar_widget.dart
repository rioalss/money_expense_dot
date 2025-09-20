import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:money_expense_dot/shared/gen/assets.gen.dart';
import 'package:money_expense_dot/themes/typography.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () => Get.back(),
        child: Container(
          height: 36.h,
          width: 36.w,
          margin: EdgeInsets.only(left: 20.w),
          padding: EdgeInsets.symmetric(
            vertical: 7.95.h,
          ),
          child: Assets.icons.arrowIcon.svg(fit: BoxFit.scaleDown),
        ),
      ),
      title: Text(
        title,
        style: Font.bold.fs18.gray1(),
      ),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}
