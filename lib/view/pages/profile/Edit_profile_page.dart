import 'package:final_project/controller/dio/endpoints.dart';
import 'package:final_project/view/widgets/default_button.dart';
import 'package:final_project/view_model/login_cubit/login_cubit.dart';
import 'package:final_project/view_model/profile_cubit/get_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../utilities/theme/app_themes.dart';
import '../../widgets/default_form_field.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final editProfileCubit = BlocProvider.of<GetProfileCubit>(context);

    TextEditingController bioController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black87, fontSize: 20),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {

              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: AppTheme.darkGrey)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.h,
              ),
              const Text(
                "Name",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
              SizedBox(
                height: 1.h,
              ),
              DefaultFormField(
                obSecured: false,
                textInputAction: TextInputAction.next,
                controller: nameController,
                keyboardType: TextInputType.name,
                // prefixIcon: Icon(Icons.person_outline, size: 20.sp),
                hintText: 'name',
              ),
              SizedBox(
                height: 2.h,
              ),
              const Text(
                "Bio",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
              SizedBox(
                height: 1.h,
              ),
              DefaultFormField(
                obSecured: false,
                textInputAction: TextInputAction.next,
                controller: bioController,
                keyboardType: TextInputType.text,
                // prefixIcon: Icon(Icons.email_outlined, size: 20.sp),
                hintText: 'Bio',
              ),
              SizedBox(
                height: 2.h,
              ),
              const Text(
                "Address",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
              SizedBox(
                height: 1.h,
              ),
              DefaultFormField(
                obSecured: false,
                textInputAction: TextInputAction.next,
                controller: addressController,
                keyboardType: TextInputType.text,
                // prefixIcon: Icon(Icons.email_outlined, size: 20.sp),
                hintText: 'Address',
              ),
              SizedBox(
                height: 2.h,
              ),
              const Text(
                "No.Handphone*",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
              SizedBox(
                height: 1.h,
              ),
              DefaultFormField(
                obSecured: false,
                textInputAction: TextInputAction.next,
                controller: phoneController,
                keyboardType: TextInputType.phone,
                // prefixIcon: Icon(Icons.phone, size: 20.sp),
                hintText: 'Phone number',
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<GetProfileCubit, GetProfileState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return DefaultButton(
                  Onpressed: () {
                    print(LoginCubit.loginToken);
                    editProfileCubit.editProfile(bioController.text, addressController.text, phoneController.text);
                    Navigator.pop(context);
                  },
                  text: "Save",
                  clr: AppTheme.primaryColor,
                  Height: 7.h,
                  width: 90.w);
            },
          ),
        ],
      ),
    );
  }
}
