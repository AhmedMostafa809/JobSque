import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utilities/theme/app_themes.dart';

class RecentJobs extends StatefulWidget {
// var icon;
// Color iconColor;
  Function()?  ontap;



RecentJobs({Key? key,required this.ontap}) : super(key: key);

  @override
  State<RecentJobs> createState() => _RecentJobsState();
}

bool saved=false;

class _RecentJobsState extends State<RecentJobs> {
  changeIcon(){
    setState(() {
      saved = !saved;
    });
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap,
      child: Container(
        height: 20.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
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
                            color: Colors.black87),
                      ),Text(
                        "Zoom • United States",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),

                    ],
                  ),

                  IconButton(
                    onPressed: changeIcon,
                    icon: saved==true?const Icon(Icons.bookmark,color: Colors.blue,) : const Icon(Icons.bookmark_border,color: AppTheme.grey,),
                  )
                ],
                //2B3A8D
              ),
              Padding(
                padding:  EdgeInsets.symmetric( vertical: 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 4.h,
                      width: 17.w,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                          color: AppTheme.lightColor
                      ),
                      child:const Center(
                        child: Text('Fulltime',style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.blue)),
                      ),
                    ),
                    Container(
                      height: 4.h,
                      width: 17.w,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                          color: AppTheme.lightColor
                      ),
                      child:const Center(
                        child: Text('Remote',style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.blue)),
                      ),
                    ),
                    Container(
                      height: 4.h,
                      width: 17.w,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                          color: AppTheme.lightColor
                      ),
                      child:const Center(
                        child: Text('Senior',style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.blue)),
                      ),
                    ),
                    const Text (
                        "\$15K",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.green)),
                    const Text (
                        "/Month",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey)),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
