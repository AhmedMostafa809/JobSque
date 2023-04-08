import 'package:final_project/utilities/assets/app_assets.dart';
import 'package:final_project/view_model/register_cubit/select_job_cubit/select_job_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../../utilities/route/routes.dart';
import '../../../../utilities/theme/app_themes.dart';
import '../../../widgets/default_button.dart';
import '../../../widgets/select_job_card.dart';


class JobsPage extends StatelessWidget {
  const JobsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final selectJobCubit = BlocProvider.of<SelectJobCubit>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 10.h),
        child: BlocConsumer<SelectJobCubit, SelectJobState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    InterestedWorkCard(
                      title: "UI/UX Designer",
                      icon: Img.UXDesign,
                      select: selectJobCubit.UI_UX_designer,
                      toDo: () {
                        selectJobCubit.selectUIUXDesigner();
                      },
                    ),
                    SizedBox(width: 5.w),
                    InterestedWorkCard(
                      title: "Illustrator Category",
                      icon: Img.ilustratorDesigner,
                      select: selectJobCubit.illustratorDesigner,
                      toDo: () {
                        selectJobCubit.selectIllustratorDesigner();

                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    InterestedWorkCard(
                      title: "Developer",
                      icon: Img.developer,
                      select: selectJobCubit.developer,
                      toDo: () {
                        selectJobCubit.selectDeveloper();
                      },
                    ),
                    SizedBox(width: 5.w),
                    InterestedWorkCard(
                      title: "Management",
                      icon: Img.Management,
                      select: selectJobCubit.management,
                      toDo: () {
                        selectJobCubit.selectManagement();
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    InterestedWorkCard(
                      title: "Information Technology",
                      icon: Img.InformationTechnologi,
                      select: selectJobCubit.informationTechnology,
                      toDo: () {
                        selectJobCubit.selectInformationTechnology();
                      },
                    ),
                    SizedBox(width: 5.w),
                    InterestedWorkCard(
                      title: "Research and Analytics",
                      icon: Img.ResearchandAnalytics,
                      select: selectJobCubit.researchAnalytics,
                      toDo: () {
                        selectJobCubit.selectResearchAnalytics();
                      },
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: DefaultButton(
              Onpressed: () =>
                  Navigator.pushNamed(context, AppRoutes.locationPageRoute),
              text: "Next",
              Height: 7.h,
              width: 90.w,
              clr: AppTheme.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
