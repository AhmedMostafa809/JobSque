import  'package:final_project/utilities/assets/app_assets.dart';
import 'package:final_project/view/widgets/suggested_job_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

import '../../../../utilities/route/routes.dart';
import '../../../../utilities/theme/app_themes.dart';
import '../../../widgets/default_button.dart';

class JobDetails extends StatefulWidget {
  final intialIndex;

  const JobDetails({Key? key, required this.intialIndex}) : super(key: key);

  @override
  State<JobDetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(vsync: this, length: 3, initialIndex: widget.intialIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppTheme.grey,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Job Details',
          style: TextStyle(color: Colors.black87, fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/Zoom Logo.png',
                      width: 7.h,
                    ),
                    const Text(
                      "Product Designer",
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87),
                    ),
                    const Text(
                      "Zoom • United States",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 4.h,
                      width: 17.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppTheme.lightColor),
                      child: const Center(
                        child: Text('Fulltime',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.blue)),
                      ),
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Container(
                      height: 4.h,
                      width: 17.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppTheme.lightColor),
                      child: const Center(
                        child: Text('Remote',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.blue)),
                      ),
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Container(
                      height: 4.h,
                      width: 17.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppTheme.lightColor),
                      child: const Center(
                        child: Text('Senior',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.blue)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
              flex: 3,
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  elevation: 0,
                  backgroundColor: Colors.white,
                  toolbarHeight: 5.h,
                  flexibleSpace: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Container(
                      height: 5.h,
                      decoration: BoxDecoration(
                          color: AppTheme.lightGrey,
                          borderRadius: BorderRadius.circular(30)),
                      child: TabBar(
                        // padding: EdgeInsets.symmetric(horizontal: 8),
                        // indicatorColor: AppTheme.darkBlue,
                        unselectedLabelColor: AppTheme.grey,
                        // indicatorColor: AppTheme.darkBlue,
                        indicator: BoxDecoration(
                            color: AppTheme.darkBlue,
                            borderRadius: BorderRadius.circular(30)),
                        tabs: const [
                          Text('Description'),
                          Text('Company'),
                          Text('People'),
                        ],
                        controller: _tabController,
                      ),
                    ),
                  ),
                ),
                body: TabBarView(
                    physics: BouncingScrollPhysics(),
                    controller: _tabController, children: [
                  Padding(
                    padding: EdgeInsets.all(15.sp),
                    child: SingleChildScrollView(physics: BouncingScrollPhysics(),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Job Description',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Your role as the UI Designer is to use interactive components on various platforms (web, desktop and mobile). This will include producing high-fidelity mock-ups, iconography, UI illustrations/graphics, and other graphic elements. As the UI Designer, you will be supporting the wider design team with the internal Design System, tying together the visual language. You will with other UI and UX Designers, Product Managers, and Engineering teams in a highly customer-focused agile environment to help define the vision of the products.',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: AppTheme.grey),
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Skill Required',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            SizedBox(height: 15),
                            Text(
                              'A strong visual portfolio with clear understanding of UI methodologies\n'
                              'Ability to create hi-fidelity mock-ups in Figma \n'
                              'Ability to create various graphics for the web e.g. illustrations and icons\n'
                              'Able to facilitate workshops and liaise with stakeholders \n'
                              ' Proficiency in the Adobe Creative Suite Confident',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: AppTheme.grey),
                            ),
                          ]),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.sp),
                    child: SingleChildScrollView(physics: BouncingScrollPhysics(),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            const Text(
                              'Contact Us',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: AppTheme.grey)
                                  ),
                                  width: 40.w,
                                  height: 8.h,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: const [
                                        Text('Email ', style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            color: AppTheme.grey),),
                                        Text('twitter@mail.com'),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: AppTheme.grey)
                                  ),
                                  width: 40.w,
                                  height: 8.h,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: const [
                                        Text('Website ', style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            color: AppTheme.grey),),
                                        Text('https://twitter.com'),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),


                            const SizedBox(height: 15),
                            const Text(
                              'About Company',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            const SizedBox(height: 15),
                            const Text(
                              'Understanding Recruitment is an award-winning technology, software and digital recruitment consultancy with headquarters in St. Albans, Hertfordshire.We also have a US office in Boston, Massachusetts specialising in working closely with highly skilled individuals seeking their next career move within Next Gen Tech, Backend Engineering, and Artificial Intelligence.We recently celebrated our first decade in business and over the years have been recognised with several industry awards including Best Staffing Firm to Work For 2018​ at the SIA Awards for the third consecutive year and ‘Business of the Year 2017’ at the SME Hertfordshire Business Awards.Our teams of specialists operate across all areas of Technology and Digital, including Java, JavaScript, Python, .Net, DevOps & SRE, SDET, Artificial Intelligence, Machine Learning, AI, Digital, Quantum Computing, Hardware Acceleration, Digital, Charity, Fintech, and the Public Sector.',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: AppTheme.grey),
                            ),
                          ]),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(15.sp),
                    child: ListView(physics: BouncingScrollPhysics(),
                      children: [
                        Image.asset('assets/Dimas Adi Saputro.png'),
                        SizedBox(height: 2.h,),
                        Image.asset('assets/Dimas Adi Saputro.png'),
                        SizedBox(height: 2.h,),
                        Image.asset('assets/Dimas Adi Saputro.png'),
                        SizedBox(height: 2.h,),
                        Image.asset('assets/Dimas Adi Saputro.png'),
                        SizedBox(height: 2.h,),
                        Image.asset('assets/Dimas Adi Saputro.png'),
                        SizedBox(height: 2.h,),
                        Image.asset('assets/Dimas Adi Saputro.png'),
                      ],
                    ),
                  ),
                ]),
              ))
        ],
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DefaultButton(
            Onpressed: () => Navigator.pushNamed(context, AppRoutes.stepperRoute),
            text: "Apply now",
            Height: 7.h,
            width: 90.w,
            clr: AppTheme.primaryColor,
          ),
        ],
      ),
    );
  }
}
