import 'dart:io';
import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:final_project/utilities/enums/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

import '../../../../utilities/route/routes.dart';
import '../../../../utilities/theme/app_themes.dart';
import '../../../widgets/default_button.dart';
import '../../../widgets/default_form_field.dart';

class ApplyStepsStepper extends StatefulWidget {
  const ApplyStepsStepper({Key? key}) : super(key: key);

  @override
  _ApplyStepsStepperState createState() => _ApplyStepsStepperState();
}

int activeStep = 0;

int _currentStep = 0;
StepperType stepperType = StepperType.horizontal;

class _ApplyStepsStepperState extends State<ApplyStepsStepper> {
  @override
  String pdf = '';
  TextEditingController emailApplyController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  JobChoice? _choice = JobChoice.Ux;

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
            _currentStep > 0 ? cancel() : Navigator.pop(context);
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
      body: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
          // backgroundColor: Colors.white,
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: AppTheme.blue,
              ),
          // iconTheme: Theme.of(context).iconTheme.copyWith(size: 50.0),
          //
          // accentIconTheme: Theme.of(context).iconTheme.copyWith(size: 50.0),
          // primaryIconTheme: Theme.of(context).iconTheme.copyWith(
          //       size: 50.0,
          //     ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Stepper(
                elevation: 0,
                type: stepperType,
                // physics:  BouncingScrollPhysics(),
                currentStep: _currentStep,
                controlsBuilder: (context, details) {
                  return const SizedBox();
                },
                // onStepTapped: (step) => tapped(step),
                // onStepContinue: continued,
                // onStepCancel: cancel,
                steps: <Step>[
                  Step(
                    title: const SizedBox(),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Biodata",
                          style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        const Text(
                          "Fill in your bio data correctly",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        const Text(
                          "Full Name",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        DefaultFormField(
                          obSecured: false,
                          textInputAction: TextInputAction.next,
                          controller: fullNameController,
                          keyboardType: TextInputType.name,
                          prefixIcon: Icon(Icons.person_outline, size: 20.sp),
                          hintText: 'Full name',
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        const Text(
                          "Email",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        DefaultFormField(
                          obSecured: false,
                          textInputAction: TextInputAction.next,
                          controller: emailApplyController,
                          keyboardType: TextInputType.emailAddress,
                          prefixIcon: Icon(Icons.email_outlined, size: 20.sp),
                          hintText: 'Email',
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        const Text(
                          "No.Handphone*",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        DefaultFormField(
                          obSecured: false,
                          textInputAction: TextInputAction.next,
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          prefixIcon: Icon(Icons.phone, size: 20.sp),
                          hintText: 'Phone number',
                        ),
                      ],
                    ),
                    isActive: _currentStep == 0,
                    state: _currentStep == 0
                        ? StepState.indexed
                        : StepState.complete,
                    label: const Text(
                      '     Biodata     ',
                      style: TextStyle(color: AppTheme.blue, fontSize: 12),
                    ),
                  ),
                  Step(
                    title: const SizedBox(),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Type of work",
                          style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        const Text(
                          "Fill in your bio data correctly",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: _choice == JobChoice.Ux
                                  ? AppTheme.lightColor
                                  : Colors.transparent,
                              border: Border.all(
                                color: _choice == JobChoice.Ux
                                    ? AppTheme.blue
                                    : Colors.grey,
                              )),
                          child: RadioListTile(
                            controlAffinity: ListTileControlAffinity.trailing,
                            title: const Text('Senior UX Designer'),
                            subtitle: const Text('CV.pdf . Portfolio.pdf'),
                            value: JobChoice.Ux,
                            onChanged: (JobChoice? value) {
                              _choice = value;
                              setState(() {});
                            },
                            groupValue: _choice,
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: _choice == JobChoice.Ui
                                  ? AppTheme.lightColor
                                  : Colors.transparent,
                              border: Border.all(
                                color: _choice == JobChoice.Ui
                                    ? AppTheme.blue
                                    : Colors.grey,
                              )),
                          child: RadioListTile(
                            controlAffinity: ListTileControlAffinity.trailing,
                            title: const Text('Senior UI Designer'),
                            subtitle: const Text('CV.pdf . Portfolio.pdf'),
                            value: JobChoice.Ui,
                            onChanged: (JobChoice? value) {
                              _choice = value;
                              setState(() {});
                            },
                            groupValue: _choice,
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: _choice == JobChoice.GD
                                  ? AppTheme.lightColor
                                  : Colors.transparent,
                              border: Border.all(
                                color: _choice == JobChoice.GD
                                    ? AppTheme.blue
                                    : Colors.grey,
                              )),
                          child: RadioListTile(
                            controlAffinity: ListTileControlAffinity.trailing,
                            title: const Text('Graphik Designer'),
                            subtitle: const Text('CV.pdf . Portfolio.pdf'),
                            value: JobChoice.GD,
                            onChanged: (JobChoice? value) {
                              _choice = value;
                              setState(() {});
                            },
                            groupValue: _choice,
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: _choice == JobChoice.FE
                                  ? AppTheme.lightColor
                                  : Colors.transparent,
                              border: Border.all(
                                color: _choice == JobChoice.FE
                                    ? AppTheme.blue
                                    : Colors.grey,
                              )),
                          child: RadioListTile(
                            controlAffinity: ListTileControlAffinity.trailing,
                            title: const Text('Front-End Developer'),
                            subtitle: const Text('CV.pdf . Portfolio.pdf'),
                            value: JobChoice.FE,
                            onChanged: (JobChoice? value) {
                              _choice = value;
                              setState(() {});
                            },
                            groupValue: _choice,
                          ),
                        ),
                      ],
                    ),
                    isActive: _currentStep == 1,
                    state: _currentStep <= 1
                        ? StepState.indexed
                        : StepState.complete,
                    label: const Text(
                      '  Type of work  ',
                      style: TextStyle(color: AppTheme.blue, fontSize: 12),
                    ),
                  ),
                  Step(
                      title: const SizedBox(),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Type of work",
                            style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w400,
                                color: Colors.black87),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          const Text(
                            "Fill in your bio data correctly",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          const Text(
                            "Upload CV*",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black87),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          pdf.isEmpty
                              ? const Center(
                                  child: Text('No files uploaded'),
                                )
                              : Container(
                                  height: 10.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.transparent,
                                      border: Border.all(
                                        color: Colors.grey,
                                      )),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4.0.w),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/Vector.png',
                                          height: 5.h,
                                        ),
                                        SizedBox(
                                          width: 3.w,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(pdf),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            const Text(
                                              'CV.pdf 300KB',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12),
                                            )
                                          ],
                                        ),
                                        const Spacer(),
                                        InkWell(
                                          onTap: () async {
                                            FilePickerResult? result =
                                                await FilePicker.platform
                                                    .pickFiles();
                                            if (result != null) {
                                              PlatformFile file =
                                                  result.files.first;
                                              pdf = file.name;
                                              setState(() {});
                                            } else {
                                              print('No file selected');
                                            }
                                          },
                                          child: Icon(
                                              Icons.mode_edit_outline_outlined,
                                              color: AppTheme.primaryColor,
                                              size: 25.sp),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            pdf = '';
                                            setState(() {});
                                          },
                                          child: Icon(
                                              Icons.highlight_remove_outlined,
                                              color: Colors.red,
                                              size: 25.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 3.h),
                            child: DottedBorder(
                              radius: const Radius.circular(8),
                              borderType: BorderType.RRect,
                              dashPattern: const [7, 5],
                              color: Colors.blue,
                              strokeWidth: 1.5,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: AppTheme.lightblue,
                                    borderRadius: BorderRadius.circular(8)),
                                width: double.infinity,
                                height: 25.h,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CircleAvatar(
                                      radius: 20.sp,
                                      backgroundColor: AppTheme.lightColor,
                                      child: Icon(
                                        Icons.upload_file,
                                        size: 25.sp,
                                      ),
                                    ),
                                    const Text(
                                      'Upload your other file',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87),
                                    ),
                                    const Text(
                                      'Max. file size 10 MB',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    ),
                                    // ElevatedButton(onPressed: (){}, child: Text('Add file'))
                                    SizedBox(
                                      width: 80.w,
                                      height: 6.h,
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          FilePickerResult? result =
                                              await FilePicker.platform
                                                  .pickFiles();
                                          if (result != null) {
                                            PlatformFile file =
                                                result.files.first;
                                            pdf = file.name;
                                            setState(() {});
                                          } else {
                                            print('No file selected');
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppTheme.lightblue,
                                          shape: const StadiumBorder(),
                                          side: const BorderSide(
                                              color: AppTheme.primaryColor,
                                              width: 2),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Icon(
                                              Icons.upload_outlined,
                                              color: AppTheme.primaryColor,
                                            ),
                                            Text(
                                              'Add file',
                                              style: TextStyle(
                                                  color: AppTheme.primaryColor,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                        ],
                      ),
                      isActive: _currentStep == 2,
                      state: _currentStep <= 2
                          ? StepState.indexed
                          : StepState.complete,
                      label: const Text(
                        'Upload portfolio',
                        style: TextStyle(color: AppTheme.blue, fontSize: 12),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DefaultButton(
            Onpressed: () {
              _currentStep < 2
                  ? continued()
                  : Navigator.pushNamed(context, AppRoutes.applySuccessRoute);
            },
            text: _currentStep == 2 ? "Submit" : 'Next',
            Height: 7.h,
            width: 90.w,
            clr: AppTheme.primaryColor,
          ),
        ],
      ),
    );
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}
