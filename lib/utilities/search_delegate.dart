import 'package:final_project/utilities/theme/app_themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'assets/app_assets.dart';

class jobSearch extends SearchDelegate {
  List<String> jobsList = [
    "Junior UI Designer",
    "Junior UX Designer",
    "Product Designer",
    "Project Manager",
    "UI/UX Designer",
    "Front-End DeveloperFront-End Developer",
    "honklolo","baha2 soltan",
    'koko','messi'
  ];

  List<String> recentJobs = [
    "Junior UI Designer",
    "Junior UX Designer",
    "Product Designer",
    "Project Manager",
    "UI/UX Designer",
    "Front-End Developer",
    "honklolo"
  ];

  List<String> popularJobs = [
    "UI/UX Designer",
    "Project Manager",
    "Product Designer",
    "UX Designer",
    "Front-End Developer",
    "baha2 soltan"
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
    // throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<String> searchResult = jobsList
        .where((element) => element.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: searchResult.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(searchResult.elementAt(index)),
          );
        });
  }










  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> searchResult = jobsList
        .where((element) => element.toLowerCase().contains(query.toLowerCase()))
        .toList();
    final List<String> suggestions = recentJobs
        .where((element) => element.toLowerCase().contains(query.toLowerCase()))
        .toList();
    final List<String> popular = popularJobs
        .where((element) => element.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return searchResult.isEmpty
        ? ListView(

            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 15.h),
                child: Column(
                  children: [
                    Image.asset(
                      Img.search,
                      height: 30.h,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    const Text(
                      "Search not found",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "Try searching with different keywords so we can show you",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppTheme.grey),
                    ),
                  ],
                ),
              ),
            ],
          )
        : ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              suggestions.isEmpty? Text('') : Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 4.h,
                    color: AppTheme.lightGrey,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                      child: const Text(
                        'Recent search',
                        style: TextStyle(color: AppTheme.grey),
                      ),
                    ),
                  ),
                  ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: suggestions.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const Icon(Icons.watch_later_outlined),
                          title: Text(suggestions.elementAt(index)),
                          trailing: const Icon(
                            Icons.remove_circle_outline,
                            color: Colors.red,
                          ),
                        );
                      }),
                ],
              ),
              popular.isEmpty? Text('') :  Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 4.h,
                    color: AppTheme.lightGrey,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                      child: const Text(
                        'Popular search',
                        style: TextStyle(color: AppTheme.grey),
                      ),
                    ),
                  ),
                  ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: popular.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const Icon(Icons.search),
                          title: Text(popular.elementAt(index)),
                          trailing: const Icon(
                            Icons.arrow_circle_right_outlined,
                            color: Colors.blue,
                          ),
                        );
                      }),
                ],
              ),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: searchResult.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: query.contains(searchResult.elementAt(index))? Text(searchResult.elementAt(index)):null,
                    );
                  })
            ],
          );
  }
}
