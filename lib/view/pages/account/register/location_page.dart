import 'package:final_project/utilities/assets/app_assets.dart';
import 'package:final_project/view_model/register_cubit/select_location/select_job_location_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../utilities/route/routes.dart';
import '../../../../utilities/theme/app_themes.dart';
import '../../../widgets/default_button.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectLocationCupit = BlocProvider.of<SelectJobLocationCubit>(context);
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 10.h),
      child: ListView(physics: const BouncingScrollPhysics(), children: [
        const Text(
          "Where are you prefefred Location?",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 8,
        ),
        const Text(
          "Let us know, where is the work location you want at this time, so we can adjust it.",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppTheme.grey),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 7.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppTheme.lightGrey,
              borderRadius: BorderRadiusDirectional.circular(30)),
          child: BlocConsumer<SelectJobLocationCubit, SelectJobLocationState>(
            listener: (context, state) {

            },
            builder: (context, state) {
              return Row(
                children: [
                  MaterialButton(
                    onPressed: () {
                      office = selectLocationCupit.setOfficeJobs(office);
                      remote = selectLocationCupit.returnFalse(remote);
                    },
                    height: 7.h,
                    minWidth: 40.w,
                    color:
                        office == true ? AppTheme.darkBlue : AppTheme.lightGrey,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                  'Work From Office',
                  style: TextStyle(
                      color: office == true ? Colors.white : AppTheme.grey),
                ),
              ),
              const Spacer(),
              MaterialButton(
                onPressed: () {
                  remote = selectLocationCupit.setRemoteJobs(remote);
                  office = selectLocationCupit.returnFalse(office);
                  },
                height: 7.h,
                minWidth: 40.w,
                color:
                    remote == true ? AppTheme.darkBlue : AppTheme.lightGrey,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  'Remote Work',
                  style: TextStyle(
                      color: remote == true ? Colors.white : AppTheme.grey),
                ),
              ),
            ],
          );
  },
),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Select the country you want for your job",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppTheme.grey),
        ),
        const SizedBox(
          height: 10,
        ),
        GridView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: countryImg.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10),
          itemBuilder: (BuildContext context, int index) {
            return BlocConsumer<SelectJobLocationCubit, SelectJobLocationState>(
              listener: (context, state) {},
              builder: (context, state) {
                return InkWell(
                  onTap: () {
                    countrySelection[index] = selectLocationCupit
                        .selectLocation(countrySelection[index]);
                    if ( countrySelection[index] == true){
                      selectedCountriesList.add(countryName[index]);

                    }
                    else
                      selectedCountriesList.remove(countryName[index]);
                    print(selectedCountriesList);
                  },
                  child: Container(
                    height: 7.h,
                    width: 35.w,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: countrySelection[index] == true
                                ? AppTheme.primaryColor
                                : AppTheme.grey),
                        color: countrySelection[index] == true
                            ? AppTheme.lightblue
                            : AppTheme.lightGrey,
                        borderRadius: BorderRadius.circular(100)),
                    child: Row(
                      children: [
                        Image.asset(
                          countryImg[index],
                          height: 5.h,
                        ),
                        Text(countryName[index])
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: DefaultButton(
            Onpressed: () => Navigator.pushNamed(
                context, AppRoutes.RegisterSuccessPageRoute),
            text: "Next",
            Height: 7.h,
            width: double.infinity,
            clr: AppTheme.primaryColor,
          ),
        ),
      ]),
    ));
  }
}

bool office = true, remote = false;
bool? UnitedStates,
    Malaysia,
    Singapore,
    Indonesia,
    Philiphines,
    Polandia,
    India,
    Vietnam,
    China,
    Canada,
    SaudiArabia,
    Argentina,
    Brazil;

List countrySelection = [
  UnitedStates = false,
  Malaysia = false,
  Singapore = false,
  Indonesia = false,
  Philiphines = false,
  Polandia = false,
  India = false,
  Vietnam = false,
  China = false,
  Canada = false,
  SaudiArabia = false,
  Argentina = false,
  Brazil = false
];

List countryImg = [
  Img.america,
  Img.malisia,
  Img.singaphor,
  Img.indonisia,
  Img.philipine,
  Img.poland,
  Img.india,
  Img.vitnam,
  Img.china,
  Img.canada,
  Img.saudia,
  Img.argantine,
  Img.brazil,
];
List countryName = [
  'United States',
  'Malaysia',
  'Singapore',
  'Indonesia',
  'Philiphines',
  'Polandia',
  'India',
  'Vietnam',
  'China',
  'Canada',
  'Saudi Arabia',
  'Argentina',
  'Brazil',
];
List selectedCountriesList = [];
