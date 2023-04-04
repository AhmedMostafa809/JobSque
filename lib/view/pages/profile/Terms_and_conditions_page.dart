import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../utilities/theme/app_themes.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Terms & Conditions',
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
        padding:  EdgeInsets.all( 15.0.sp),
        child: ListView(
          children:  [
            const Text('Lorem ipsum dolor',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            SizedBox(height: 2.h,),
            const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra.'
                ' Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet,'
                ' consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi,'
                ' at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra.'
                ' Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. '
            ,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,fontSize: 14),
            ),
            SizedBox(height: 2.h,),
            const Text('Lorem ipsum dolor',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            SizedBox(height: 2.h,),
            const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra.'
                ' Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet,'
                ' consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi,'
                ' at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra.'
                ' Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. '
              ,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
