import 'package:final_project/utilities/assets/app_assets.dart';
import 'package:final_project/utilities/route/routes.dart';
import 'package:final_project/utilities/theme/app_themes.dart';
import 'package:final_project/view/widgets/default_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

final PageController controller = PageController();

class _OnBoardingState extends State<OnBoarding> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(

            elevation: 0,
            flexibleSpace: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Image.asset(
                    Img.AppLogo,
                    width: 25.w,
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context, AppRoutes.jobsPageRoute ,(route) => false);
                      },
                      child: const Text("Skip",
                          style: TextStyle(fontSize: 16, color: AppTheme.grey)))
                ],
              ),
            ),
            backgroundColor: Colors.white,
            toolbarHeight: 5.h,
          ),
          backgroundColor: Colors.white,
          body: PageView(
            onPageChanged: (index) {
              setState(() {
                isLastPage = index == 2;
              });
            },
            controller: controller,
            children: [
              Column(
                children: [
                  Center(child: Image.asset(Img.boarding1)),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "Find a job, and start building your career from now on",
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                        "Explore over 25,924 available job roles and upgrade your operator now.",
                        style: TextStyle(fontSize: 16, color: AppTheme.grey)),
                  )
                ],
              ),
              Column(
                children: [
                  Center(child: Image.asset(Img.boarding2)),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "Hundreds of jobs are waiting for you to join together",
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                        "Immediately join us and start applying for the job you are interested in.",
                        style: TextStyle(fontSize: 16, color: AppTheme.grey)),
                  )
                ],
              ),
              Column(
                children: [
                  Center(child: Image.asset(Img.boarding3)),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "Get the best choice for the job you've always dreamed of",
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                        "The better the skills you have, the greater the good job opportunities for you.",
                        style: TextStyle(fontSize: 16, color: AppTheme.grey)),
                  )
                ],
              ),
            ],
          ),
          bottomSheet: Container(
            height: 12.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    SmoothPageIndicator(
                      effect: const WormEffect(
                          dotHeight: 10,
                          dotWidth: 10,
                          dotColor: AppTheme.baleBlue,
                          activeDotColor: AppTheme.primaryColor),
                      controller: controller,
                      count: 3,
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DefaultButton(
                        Onpressed:isLastPage==true?()=> Navigator.pushNamedAndRemoveUntil(context, AppRoutes.registerPageRoute, (route) => false):() => controller.nextPage(
                            duration: const Duration(microseconds: 500),
                            curve: Curves.easeInOut),
                        text: isLastPage == false ? "Next" : "Get Started",
                        Height: 7.h,
                        width: 90.w,
                        clr: AppTheme.primaryColor,
                      ),
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
