import 'package:final_project/utilities/route/routes.dart';
import 'package:final_project/utilities/theme/app_themes.dart';
import 'package:final_project/view/widgets/profile_listTile.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              color: AppTheme.profileLightColor,
              width: double.infinity,
              height: 7.h ,
              child:const Center(
                child: Text(
                  'Profile',
                  style: TextStyle(fontSize:20,color: Colors.black87, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Container(
              color: AppTheme.profileLightColor,
              width: double.infinity,
              height: 20.h,
              child: Container(
                alignment: const Alignment(0.0, 2.5),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 40.sp,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: const AssetImage("assets/Profile.png"),
                    radius: 55.sp,
                  ),
                ),
              ),
            ),
            SizedBox(height: 7.h,),
            Column(
              children: const [
                Text(
                  "Rafif Dian Axelingga",
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87),
                ),
                Text(
                  "Senior UI/UX Designer",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 3.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                children: [
                  IntrinsicHeight(
                    child: Container(
                      height: 10.h,
                      color: AppTheme.lightGrey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text(
                                "Applied",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppTheme.darkGrey),
                              ),
                              Text(
                                "46",
                                style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87),
                              ),
                            ],
                          ),
                           const VerticalDivider(
                            thickness: 1,
                            indent: 10,
                            endIndent: 10,
                            color: Colors.grey,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text(
                                "Reviewed",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppTheme.darkGrey),
                              ),
                              Text(
                                "16",
                                style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87),
                              ),
                            ],
                          ),
                           const VerticalDivider(
                             thickness: 1,
                             indent: 10,
                             endIndent: 10,
                             color: Colors.grey,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text(
                                "Contacted",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppTheme.darkGrey),
                              ),
                              Text(
                                "16",
                                style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 3.h,),
                  Row(
                    children:const  [
                      Text(
                        "About",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppTheme.darkGrey),
                      ),
                      Spacer(),
                      Text(
                        "Edit",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppTheme.primaryColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h,),
                  Container(

                    height: 15.h,
                    child: const Text(
                      'Im Rafif Dian Axelingga, I’m UI/UX Designer, '
                      'I have experience designing UI Design for approximately 1'
                      ' year. I am currently joining the Vektora studio team based in'
                      ' Surakarta, Indonesia.I am a person who has a high spirit and '
                      'likes to work to achieve what I dream of.',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppTheme.darkGrey),
                    ),
                  ),

                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 4.h,
              color: AppTheme.lightGrey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                child: const Text(
                  'General',
                  style: TextStyle(color: AppTheme.grey),
                ),
              ),
            ),
            SizedBox(height: 3.h,),
            ProfileListTile(title: 'Edit Profile', onTap: (){
              Navigator.pushNamed(context, AppRoutes.editProfilePageRoute);
            }, icon: Icons.person_outline),
            ProfileListTile(title: 'Portfolio', onTap: (){
              Navigator.pushNamed(context, AppRoutes.portfolioPageRoute);
            }, icon: Icons.camera_alt_outlined),
            ProfileListTile(title: 'Language', onTap: (){
              Navigator.pushNamed(context, AppRoutes.languagePageRoute);
            }, icon: Icons.language),
            ProfileListTile(title: 'Notification', onTap: (){
              Navigator.pushNamed(context, AppRoutes.profileNotificationsPageRoute);
            }, icon: Icons.notifications_none),
            ProfileListTile(title: 'Login and security', onTap: (){
              Navigator.pushNamed(context, AppRoutes.loginAndSecurityRoute);
            }, icon: Icons.lock_outline),
            SizedBox(height: 3.h,),
            Container(
              width: double.infinity,
              height: 4.h,
              color: AppTheme.lightGrey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                child: const Text(
                  'Others',
                  style: TextStyle(color: AppTheme.grey),
                ),
              ),
            ),
            SizedBox(height: 3.h,),
            ListTile(
              title: const Text('Accesibility'),
              onTap: (){},
              trailing: const Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: const Text('Help Center'),
              onTap: (){
                Navigator.pushNamed(context, AppRoutes.helpCenterPageRoute);
              },
              trailing: const Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: const Text('Terms & Conditions'),
              onTap: (){
                Navigator.pushNamed(context, AppRoutes.termsAndConditionsRoute);
              },
              trailing: const Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: const Text('Privacy Policy'),
              onTap: (){
                Navigator.pushNamed(context, AppRoutes.privacyPolicyPageRoute);
              },
              trailing: const Icon(Icons.arrow_forward),
            ),

          ],
        ),
      ),
    );
  }
}
