import 'package:final_project/view/pages/Messages/messages_page.dart';
import 'package:final_project/view/widgets/default_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../utilities/theme/app_themes.dart';

TextEditingController messageController = TextEditingController();

class SendMessagePage extends StatelessWidget {
  int indx;

  SendMessagePage({Key? key, required this.indx}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 10.h,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.darkGrey),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            messageImages[indx],
            SizedBox(
              width: 3.w,
            ),
            Text(
              messageTitle[indx],
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 20.w, left: 5.w, bottom: 3.h),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: AppTheme.lightGrey),
                    child: Padding(
                      padding: EdgeInsets.all(20.sp),
                      child: const Text(
                          'Hi Rafif!, Im Melan the selection team from Twitter. Thank you for applying for a job at our company. We have announced that you are eligible for the interview stage.'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 5.w, bottom: 3.h),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: AppTheme.primaryColor),
                    child: Padding(
                      padding: EdgeInsets.all(20.sp),
                      child: const Text(
                        'Hi Melan, thank you for considering me, this is good news for me.,',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20.w, left: 5.w, bottom: 3.h),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: AppTheme.lightGrey),
                    child: Padding(
                      padding: EdgeInsets.all(20.sp),
                      child: const Text(
                          'Hi Rafif!, Im Melan the selection team from Twitter. Thank you for applying for a job at our company. We have announced that you are eligible for the interview stage.'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 5.w, bottom: 3.h),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: AppTheme.primaryColor),
                    child: Padding(
                      padding: EdgeInsets.all(20.sp),
                      child: const Text(
                        'Hi Melan, thank you for considering me, this is good news for me.,',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20.w, left: 5.w, bottom: 3.h),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: AppTheme.lightGrey),
                    child: Padding(
                      padding: EdgeInsets.all(20.sp),
                      child: const Text(
                          'Hi Rafif!, Im Melan the selection team from Twitter. Thank you for applying for a job at our company. We have announced that you are eligible for the interview stage.'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 5.w, bottom: 3.h),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: AppTheme.primaryColor),
                    child: Padding(
                      padding: EdgeInsets.all(20.sp),
                      child: const Text(
                        'Hi Melan, thank you for considering me, this is good news for me.,',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 3.2.h,
                  backgroundColor: Colors.grey,
                  child: CircleAvatar(
                    radius: 3.h,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.attachment_rounded,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: AppTheme.grey)),
                  height: 7.h,
                  width: 60.w,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                          controller: messageController,
                          decoration: const InputDecoration(
                            hintText: 'Write a message',
                            border: InputBorder.none,
                          ))),
                ),
                CircleAvatar(
                  radius: 3.2.h,
                  backgroundColor: Colors.grey,
                  child: CircleAvatar(
                    radius: 3.h,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.mic_none_outlined,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
