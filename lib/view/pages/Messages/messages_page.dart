import 'package:final_project/utilities/assets/app_assets.dart';
import 'package:final_project/utilities/route/routes.dart';
import 'package:final_project/view/pages/Home_pages/Layout.dart';
import 'package:final_project/view/pages/Home_pages/home_screen.dart';
import 'package:final_project/view/pages/Messages/send_message_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../utilities/theme/app_themes.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Messages',
          style: TextStyle(color: Colors.black87, fontSize: 20),
        ),
        centerTitle: true,
        leading:  const Icon(Icons.arrow_back,color: AppTheme.darkGrey),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0.sp),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: AppTheme.grey)),
              height: 7.h,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(children: [
                  Icon(
                    Icons.search,
                    size: 25.sp,
                    color: AppTheme.grey,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Search',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppTheme.grey),
                    ),
                  )
                ]),
              ),
            ),
            ListView.builder(
              itemBuilder: (context, index) => Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: 1.h),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SendMessagePage(indx: index),));
                      },
                      contentPadding: EdgeInsets.symmetric(horizontal: 1.w ),
                      leading: messageImages[index],
                      title: Row(
                        children: [
                          Text(
                            messageTitle[index],
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          const Spacer(),
                          Text(
                            messageTime[index],
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppTheme.blue),
                          ),
                        ],
                      ),
                      subtitle: Text(
                        messageContent[index],
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    endIndent: 20,
                    indent: 20.w,
                  )
                ],
              ),
              itemCount: 3,
              shrinkWrap: true,
            )
          ],
        ),
      ),
    );
  }
}
List<Image> messageImages = [
  Image.asset(Img.Twitter),
  Image.asset(Img.Gojek),
  Image.asset(Img.Dana),
];
List<String> messageTitle = ['Twitter', 'Gojek Indonesia', 'Dana'];
List<String> messageContent = [
  'Here is the link: http://zoom.com/abcdeefg',
  'Let’s keep in touch.',
  'Thank you for your attention!'
];
List<String> messageTime = ['12.30', '12.30', 'Yesterday'];
