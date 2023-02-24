import 'package:final_project/utilities/theme/app_themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

class SuggestedJobs extends StatelessWidget {
  const SuggestedJobs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.h,
      width: 90.w,
      decoration: BoxDecoration(
        color: AppTheme.darkBlue,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/Zoom Logo.png',
                  width: 5.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Product Designer",
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),Text(
                      "Zoom • United States",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),

                  ],
                ),
                Icon(Icons.bookmark_border,color: Colors.white,size: 25.sp,)
              ],
              //2B3A8D
            ),
            Padding(
              padding:  EdgeInsets.symmetric( vertical: 2.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 5.h,
                    width: 25.w,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                    color: AppTheme.baleBlue
                    ),
                    child:const Center(
                      child: Text('Fulltime',style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                    ),
                  ),
                Container(
                    height: 5.h,
                    width: 25.w,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                    color: AppTheme.baleBlue
                    ),
                    child:const Center(
                      child: Text('Remote',style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                    ),
                  ),
                Container(
                    height: 5.h,
                    width: 25.w,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                    color: AppTheme.baleBlue
                    ),
                    child:const Center(
                      child: Text('Design',style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children:  [
                const Text (
                  "\$12K-15K",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white)),
                const Text (
                    "/Month",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey)),
                Spacer(),
                Container(
                  height: 5.h,
                  width: 30.w,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                      color: Colors.blue
                  ),
                  child:const Center(
                    child: Text('Apply now',style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white)),
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
