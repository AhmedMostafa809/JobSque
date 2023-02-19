import 'package:final_project/utilities/assets/app_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

import '../../../../utilities/route/routes.dart';
import '../../../../utilities/theme/app_themes.dart';
import '../../../widgets/default_button.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

bool? office, remote;

List<Map> countries = [
  {
    'image': Img.america,
    'name': 'United States',
    'selected': false,
  },
  {
    'image': Img.malisia,
    'name': 'Malaysia',
    'selected': false,
  },
  {
    'image': Img.singaphor,
    'name': 'Singapore',
    'selected': false,
  },
  {
    'image': Img.indonisia,
    'name': 'Indonesia',
    'selected': false,
  },
  {
    'image': Img.philipine,
    'name': 'Philiphines',
    'selected': false,
  },
  {
    'image': Img.poland,
    'name': 'Polandia',
    'selected': false,
  },
  {
    'image': Img.india,
    'name': 'India',
    'selected': false,
  },
  {
    'image': Img.vitnam,
    'name': 'Vietnam',
    'selected': false,
  },
  {
    'image': Img.china,
    'name': 'China',
    'selected': false,
  },
  {
    'image': Img.canada,
    'name': 'Canada',
    'selected': false,
  },
  {
    'image': Img.saudia,
    'name': 'Saudi Arabia',
    'selected': false,
  },
  {
    'image': Img.argantine,
    'name': 'Argentina',
    'selected': false,
  },
  {
    'image': Img.brazil,
    'name': 'Brazil',
    'selected': false,
  },
];

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 10.h),
      child: RefreshIndicator(
        onRefresh: () async {
          for (final country in countries) {
            country['selected'] = false;
          }
          setState(() {});
        },
        child: ListView(physics: BouncingScrollPhysics(), children: [
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
            child: Row(
              children: [
                MaterialButton(
                  onPressed: () {
                    office = true;
                    remote = false;
                    setState(() {});
                  },
                  child: Text(
                    'Work From Office',
                    style: TextStyle(
                        color: office == true ? Colors.white : AppTheme.grey),
                  ),
                  height: 7.h,
                  minWidth: 40.w,
                  color:
                      office == true ? AppTheme.darkBlue : AppTheme.lightGrey,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                Spacer(),
                MaterialButton(
                  onPressed: () {
                    remote = true;
                    office = false;
                    setState(() {});
                  },
                  child: Text(
                    'Work From Office',
                    style: TextStyle(
                        color: remote == true ? Colors.white : AppTheme.grey),
                  ),
                  height: 7.h,
                  minWidth: 40.w,
                  color:
                      remote == true ? AppTheme.darkBlue : AppTheme.lightGrey,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
              ],
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



          Wrap(
            // alignment: WrapAlignment.,
            // spacing: 15.sp,
            // runAlignment: WrapAlignment.spaceEvenly,
            direction: Axis.horizontal,

            children: [
              for (final country in countries)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                  child: InkWell(
                    onTap: () {
                      country['selected'] = true;
                      setState(() {});
                    },
                    child: Container(
                      height: 7.h,
                      width: 35.w,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: country['selected'] == true
                                  ? AppTheme.primaryColor
                                  : AppTheme.grey),
                          color: country['selected'] == true
                              ? AppTheme.baleBlue
                              : AppTheme.lightGrey,
                          borderRadius: BorderRadius.circular(100)),
                      child: Row(
                        children: [
                          Image.asset(
                            country['image'],
                            height: 5.h,
                          ),
                          Text(country['name'])
                        ],
                      ),
                    ),
                  ),
                )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: DefaultButton(
              Onpressed: () => Navigator.pushNamed(context, AppRoutes.RegisterSuccessPageRoute),
              text: "Next",
              Height: 7.h,
              width: double.infinity,
              clr: AppTheme.primaryColor,
            ),
          ),
        ]),
      ),
    ));
  }
}
