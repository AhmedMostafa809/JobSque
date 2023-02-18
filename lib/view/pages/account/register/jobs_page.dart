import 'package:final_project/utilities/assets/app_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../utilities/route/routes.dart';
import '../../../../utilities/theme/app_themes.dart';
import '../../../widgets/default_button.dart';
List imgList=[
  Img.UXDesign,
  Img.ilustratorDesigner,
  Img.developer,
  Img.Management,
  Img.InformationTechnologi,
  Img.ResearchandAnalytics
];



class JobsPage extends StatelessWidget {
  const JobsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 8.w,right: 8.w,top: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            const Text(
              "What type of work are you interested in?",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Tell us what you’re interested in so we can customise the app for your needs.",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppTheme.grey),
            ),
            const SizedBox(
              height: 60,
            ),
            Expanded(
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 1),
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: 6,itemBuilder: (context, index) {
                  return InkWell(
                      onTap: (){},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(imgList[index],height: 5,width: 50,),
                      ));

              },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DefaultButton(
                Onpressed:()=> Navigator.pushNamedAndRemoveUntil(context, AppRoutes.registerPageRoute, (route) => false),
                text:  "Next" ,
                Height: 7.h,
                width: 90.w,
                clr: AppTheme.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
