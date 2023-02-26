import 'package:final_project/view/pages/Home_pages/job_details.dart';
import 'package:final_project/view/widgets/recent_jobs_card.dart';
import 'package:final_project/view/widgets/suggested_job_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sizer/sizer.dart';

import '../../../utilities/search_delegate.dart';
import '../../../utilities/theme/app_themes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

bool saved = false;



class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics:BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Hi, Rafif Dian👋",
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Create a better future for yourself here",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppTheme.grey),
                        )
                      ],
                    ),
                    const Spacer(),
                    CircleAvatar(
                      radius: 3.2.h,
                      backgroundColor: Colors.grey,
                      child: CircleAvatar(
                        radius: 3.h,
                        backgroundColor: Colors.white,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications_none,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: (){
                    showSearch(context: context, delegate: jobSearch());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: AppTheme.grey)),
                    height: 7.h,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(children: [
                        Icon(
                          Icons.search,
                          size: 25.sp,
                          color: AppTheme.grey,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Search',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppTheme.grey),
                          ),
                        )
                      ]),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: Row(
                    children: const [
                      Text(
                        "Suggested Job",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Text(
                        "View all",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.blue),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 25.h,
                  child: ListView.builder(
                    physics:BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 8.0),
                          child: SuggestedJobs(),
                        );
                      }),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: Row(
                    children: const [
                      Text(
                        "Recent Job",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Text(
                        "View all",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.blue),
                      )
                    ],
                  ),
                ),

                ListView.builder(
                    physics:BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return RecentJobs(ontap: () {
                        Navigator.push(context, MaterialPageRoute(builder:(context) =>  JobDetails(intialIndex: 1,)));
                      },);
                    }),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
