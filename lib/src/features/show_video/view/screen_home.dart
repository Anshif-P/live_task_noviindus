import 'package:flutter/material.dart';
import 'package:noviindus_live_task_/src/features/show_video/controller/get_home_datas.dart';
import 'package:noviindus_live_task_/src/features/show_video/widget/all%20categories.dart';
import 'package:noviindus_live_task_/src/util/app_url/app_url.dart';
import 'package:noviindus_live_task_/src/util/constance/colors.dart';
import 'package:noviindus_live_task_/src/util/constance/text_style.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  final ValueNotifier<int> selectedTab = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    getHomeDetials(context);
    return Consumer<HomeProvider>(
      builder: (context, obj, child) => DefaultTabController(
        length: obj.categoryList.length,
        child: Scaffold(
          backgroundColor: AppColor.backgroundColor,
          body: SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello Anshif',
                              style: AppText.defaultLight,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Welcome back to Section',
                              style: AppText.smallGrey,
                            )
                          ],
                        ),
                      ),
                      const Expanded(
                        flex: 1,
                        child: CircleAvatar(
                          radius: 40,
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    dividerColor: Colors.transparent,
                    onTap: (value) {
                      selectedTab.value = value;
                    },
                    tabAlignment: TabAlignment.start,
                    labelStyle: AppText.smallLight,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color.fromARGB(255, 105, 24, 18),
                    ),
                    indicatorSize: TabBarIndicatorSize.label,
                    padding: const EdgeInsets.only(left: 0),
                    isScrollable: true,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    unselectedLabelStyle: const TextStyle(color: Colors.white),
                    tabs: List.generate(
                      obj.categoryList.length,
                      (index) => ValueListenableBuilder(
                        valueListenable: selectedTab,
                        builder: (context, value, child) => Tab(
                          child: TabWithIcon(
                              text: obj.categoryList[index].title,
                              imagePath: obj.categoryList[index].image,
                              isSelected: selectedTab.value ==
                                  index // Adjust isSelected based on your logic
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: List.generate(
                      obj.categoryList.length,
                      (index) => AllCategories(
                        feedList: obj.feedList,
                      ), // Replace with your widget for each tab
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getHomeDetials(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3));
    Provider.of<HomeProvider>(context, listen: false).getCategories(context);
    Provider.of<HomeProvider>(context, listen: false).getFeed(context);
  }
}

class TabWithIcon extends StatelessWidget {
  final String text;
  final String imagePath;
  final bool isSelected;

  const TabWithIcon({
    super.key,
    required this.text,
    required this.imagePath,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected
            ? const Color.fromARGB(255, 105, 24, 18)
            : AppColor.backgroundColor,
        border: Border.all(
          color: isSelected ? AppColor.redColor : Colors.grey,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 30,
            width: 30,
            child: CachedNetworkImage(
              width: double.maxFinite,
              imageUrl: Urls().url + imagePath,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: AppColor.extraLightGrey,
                highlightColor: Colors.white,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(Urls().url + imagePath),
                          fit: BoxFit.cover)),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
