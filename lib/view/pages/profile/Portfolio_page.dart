import 'dart:async';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:final_project/controller/dio/endpoints.dart';
import 'package:final_project/view_model/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../utilities/theme/app_themes.dart';
import '../../../view_model/profile_cubit/get_profile_cubit.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

String portfolio = '';

class _PortfolioPageState extends State<PortfolioPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final editProfileCubit = BlocProvider.of<GetProfileCubit>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Portfolio',
          style: TextStyle(color: Colors.black87, fontSize: 20),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              // editProfileCubit.getPortofolio();
              Navigator.pop(context);
              // print("login token:${LoginCubit.loginToken}+${LoginCubit.loginId}");
            },
            icon: const Icon(Icons.arrow_back, color: AppTheme.darkGrey)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Add portfolio here',
                  style: TextStyle(color: Colors.black87, fontSize: 20)),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 3.h,
                ),
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        // ElevatedButton(onPressed: (){}, child: Text('Add file'))
                        SizedBox(
                          width: 80.w,
                          height: 6.h,
                          child: BlocConsumer<GetProfileCubit, GetProfileState>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              return ElevatedButton(
                                onPressed: () async {
                                  FilePickerResult? result =
                                      await FilePicker.platform.pickFiles();
                                  if (result != null) {
                                    PlatformFile file = result.files.first;
                                    portfolio = file.name;
                                    editProfileCubit.uploadFile(
                                        file, portfolio);
                                  } else {
                                    print('No file selected');
                                  }
                                  setState(() {});
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppTheme.lightblue,
                                  shape: const StadiumBorder(),
                                  side: const BorderSide(
                                      color: AppTheme.primaryColor, width: 2),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              FutureBuilder<List<String>>(
                future: editProfileCubit.getPortofolio(),
                initialData: editProfileCubit.cvName,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    print(snapshot.error);
                    return const Center(
                      child: Text('Failed to load portfolio list.'),
                    );
                  } else {
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: editProfileCubit.cvName.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.h),
                          child: Container(
                            height: 10.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.transparent,
                                border: Border.all(
                                  color: Colors.grey,
                                )),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/Vector.png',
                                    height: 5.h,
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  FittedBox(
                                    child: Container(
                                      width: 50.w,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FittedBox(
                                            child: Text(
                                              "${editProfileCubit.cvName[index]}",
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: false,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          const Text(
                                            'CV.pdf 300KB',
                                            style: TextStyle(
                                                color: Colors.grey, fontSize: 12),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () async {
                                      FilePickerResult? result =
                                          await FilePicker.platform.pickFiles();
                                      if (result != null) {
                                        PlatformFile file = result.files.first;
                                        portfolio = file.name;
                                        setState(() {});
                                      } else {
                                        print('No file selected');
                                      }
                                    },
                                    child: Icon(Icons.mode_edit_outline_outlined,
                                        color: AppTheme.primaryColor,
                                        size: 25.sp),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      editProfileCubit.deletePortofolio();
                                      setState(() {});
                                    },
                                    child: Icon(Icons.highlight_remove_outlined,
                                        color: Colors.red, size: 25.sp),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );

                        //   ListTile(
                        //   title: Text("${editProfileCubit.cvName[index]}"),
                        // );
                      },
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
