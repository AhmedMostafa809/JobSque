import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../utilities/enums/enums.dart';
import '../../../utilities/theme/app_themes.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);
  @override
  State<LanguagePage> createState() => _LanguagePageState();
}
languageChoice? _language = languageChoice.English;
class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Language',
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
      body: ListView(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                  child: Image.asset("assets/England.png",height: 3.h,)),
              Expanded(
                flex: 5,
                child: RadioListTile(

                  controlAffinity: ListTileControlAffinity.trailing,
                  value: languageChoice.English,
                  groupValue: _language,
                  onChanged: (languageChoice? value) {
                    _language = value;
                    setState(() {});
                  },

                  title: Text("English",style: TextStyle(fontWeight: FontWeight.w500),),
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 2,
            indent: 20,endIndent: 20,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                  child: Image.asset("assets/Indonesia.png",height: 3.h,)),
              Expanded(
                flex: 5,
                child: RadioListTile(

                  controlAffinity: ListTileControlAffinity.trailing,
                  value: languageChoice.Indonisian,
                  groupValue: _language,
                  onChanged: (languageChoice? value) {
                    _language = value;
                    setState(() {});
                  },

                  title: Text("Indonisia",style: TextStyle(fontWeight: FontWeight.w500),),
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 2,
            indent: 20,endIndent: 20,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                  child: Image.asset("assets/Saudi Arabia.png",height: 3.h,)),
              Expanded(
                flex: 5,
                child: RadioListTile(

                  controlAffinity: ListTileControlAffinity.trailing,
                  value: languageChoice.Arasbic,
                  groupValue: _language,
                  onChanged: (languageChoice? value) {
                    _language = value;
                    setState(() {});
                  },

                  title: Text("Arabic",style: TextStyle(fontWeight: FontWeight.w500),),
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 2,
            indent: 20,endIndent: 20,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                  child: Image.asset("assets/China (1).png",height: 3.h,)),
              Expanded(
                flex: 5,
                child: RadioListTile(

                  controlAffinity: ListTileControlAffinity.trailing,
                  value: languageChoice.Chinese,
                  groupValue: _language,
                  onChanged: (languageChoice? value) {
                    _language = value;
                    setState(() {});
                  },

                  title: Text("Chinese",style: TextStyle(fontWeight: FontWeight.w500),),
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 2,
            indent: 20,endIndent: 20,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                  child: Image.asset("assets/Netherlands.png",height: 3.h,)),
              Expanded(
                flex: 5,
                child: RadioListTile(

                  controlAffinity: ListTileControlAffinity.trailing,
                  value: languageChoice.Dutch,
                  groupValue: _language,
                  onChanged: (languageChoice? value) {
                    _language = value;
                    setState(() {});
                  },

                  title: Text("Dutch",style: TextStyle(fontWeight: FontWeight.w500),),
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 2,
            indent: 20,endIndent: 20,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                  child: Image.asset("assets/France.png",height: 3.h,)),
              Expanded(
                flex: 5,
                child: RadioListTile(

                  controlAffinity: ListTileControlAffinity.trailing,
                  value: languageChoice.French,
                  groupValue: _language,
                  onChanged: (languageChoice? value) {
                    _language = value;
                    setState(() {});
                  },

                  title: Text("French",style: TextStyle(fontWeight: FontWeight.w500),),
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 2,
            indent: 20,endIndent: 20,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                  child: Image.asset("assets/Germany.png",height: 3.h,)),
              Expanded(
                flex: 5,
                child: RadioListTile(

                  controlAffinity: ListTileControlAffinity.trailing,
                  value: languageChoice.Germany,
                  groupValue: _language,
                  onChanged: (languageChoice? value) {
                    _language = value;
                    setState(() {});
                  },

                  title: Text("German",style: TextStyle(fontWeight: FontWeight.w500),),
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 2,
            indent: 20,endIndent: 20,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                  child: Image.asset("assets/Japan.png",height: 3.h,)),
              Expanded(
                flex: 5,
                child: RadioListTile(

                  controlAffinity: ListTileControlAffinity.trailing,
                  value: languageChoice.Japanese,
                  groupValue: _language,
                  onChanged: (languageChoice? value) {
                    _language = value;
                    setState(() {});
                  },

                  title: Text("Japanese",style: TextStyle(fontWeight: FontWeight.w500),),
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 2,
            indent: 20,endIndent: 20,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                  child: Image.asset("assets/South Korea.png",height: 3.h,)),
              Expanded(
                flex: 5,
                child: RadioListTile(

                  controlAffinity: ListTileControlAffinity.trailing,
                  value: languageChoice.Korean,
                  groupValue: _language,
                  onChanged: (languageChoice? value) {
                    _language = value;
                    setState(() {});
                  },

                  title: Text("Korean",style: TextStyle(fontWeight: FontWeight.w500),),
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 2,
            indent: 20,endIndent: 20,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                  child: Image.asset("assets/Portugal.png",height: 3.h,)),
              Expanded(
                flex: 5,
                child: RadioListTile(

                  controlAffinity: ListTileControlAffinity.trailing,
                  value: languageChoice.Portogese,
                  groupValue: _language,
                  onChanged: (languageChoice? value) {
                    _language = value;
                    setState(() {});
                  },

                  title: Text("Portuguese",style: TextStyle(fontWeight: FontWeight.w500),),
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 2,
            indent: 20,endIndent: 20,
          ),
        ],
      ),
    );
  }
}
