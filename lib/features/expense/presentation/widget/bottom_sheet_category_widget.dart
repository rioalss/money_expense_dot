import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:money_expense_dot/shared/utils/constant/app_constant.dart';
import 'package:money_expense_dot/shared/utils/enum/category.dart';
import 'package:money_expense_dot/shared/utils/extension/double_extension.dart';
import 'package:money_expense_dot/shared/widgets/custom_modal_bottom_sheet.dart';
import 'package:money_expense_dot/shared/widgets/top_modal_bottom_sheet.dart';
import 'package:money_expense_dot/themes/typography.dart';

class BottomSheetCategoryWidget extends StatelessWidget {
  const BottomSheetCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomModalBottomSheet(
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 28.w),
      content: [
        const TopModalBottomSheet(title: 'Pilih Kategori'),
        27.h.kH,
        AnimationLimiter(
          child: AlignedGridView.count(
            padding: const EdgeInsets.only(top: 10, bottom: 0),
            mainAxisSpacing: 23,
            crossAxisSpacing: 23,
            itemCount: AppConstant.categoryList.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 3,
            itemBuilder: (context, index) {
              final data = AppConstant.categoryList[index];
              return cardCategory(index, data);
            },
          ),
        )
      ],
    );
  }

  AnimationConfiguration cardCategory(int index, Category data) {
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: .1.seconds,
      delay: .1.seconds,
      child: SlideAnimation(
        verticalOffset: 50.0,
        child: FadeInAnimation(
          child: GestureDetector(
            onTap: () {
              Get.back(result: data);
            },
            child: SizedBox(
              width: Get.width / 3,
              child: Column(
                crossAxisAlignment: () {
                  final col = index % 3;
                  switch (col) {
                    case 0:
                      return CrossAxisAlignment.start;
                    case 1:
                      return CrossAxisAlignment.center;
                    case 2:
                      return CrossAxisAlignment.end;
                    default:
                      return CrossAxisAlignment.start;
                  }
                }(),
                children: [
                  Container(
                    width: 36.w,
                    height: 36.h,
                    padding: const EdgeInsets.all(6).r,
                    decoration: BoxDecoration(
                      color: data.color,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      data.icon,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  4.h.kH,
                  Text(
                    data.name,
                    style: Font.regular.fs12.gray3(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
