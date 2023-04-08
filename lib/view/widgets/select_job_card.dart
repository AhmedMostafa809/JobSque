import 'dart:ui';

import 'package:final_project/utilities/theme/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class InterestedWorkCard extends StatelessWidget {

  bool select = false;
  String title;
  String icon;
  Function() toDo;

  InterestedWorkCard(
      {
        required this.select,
        required this.title,
        required this.icon,
        required this.toDo
      }
      );
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
          onTap: toDo,
          child: Container(
            padding: EdgeInsets.all(15),
            height: 18.h,
            decoration: BoxDecoration(
                color: select
                    ? AppTheme.lightblue
                    : AppTheme.lightGrey,

                borderRadius: const BorderRadius.all(Radius.circular(15)),
                border: Border.all(
                  width: 1.5,
                  color: select
                      ? AppTheme.primaryColor
                      : AppTheme.lightGrey,
                )
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundColor: select
                      ? AppTheme.primaryColor
                      : AppTheme.lightGrey,
                  radius: 21.sp,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20.sp,
                    child: Image.asset(
                        icon,
                        color: select
                            ? AppTheme.primaryColor
                            : AppTheme.grey,
                        width: 20.sp
                    ),
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(color: select
                      ? AppTheme.primaryColor
                      : AppTheme.grey,
                       fontSize: 16, fontWeight: FontWeight.w400,),
                )
              ],
            ),
          )
      ),
    );
  }
}
