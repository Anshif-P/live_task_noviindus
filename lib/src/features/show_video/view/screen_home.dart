import 'package:flutter/material.dart';
import 'package:noviindus_live_task_/src/features/show_video/widget/all%20categories.dart';
import 'package:noviindus_live_task_/src/util/constance/colors.dart';
import 'package:noviindus_live_task_/src/util/constance/text_style.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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
                  tabAlignment: TabAlignment.start,
                  labelStyle: AppText.smallLight,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: const Color.fromARGB(
                        255, 105, 24, 18), // Light red color when selected
                  ),
                  indicatorSize: TabBarIndicatorSize.label,
                  padding: const EdgeInsets.only(left: 7),
                  isScrollable: true,
                  labelColor: Colors.white, // Label color when selected
                  unselectedLabelColor:
                      Colors.black, // Label color when unselected
                  unselectedLabelStyle: TextStyle(color: Colors.white),
                  tabs: const [
                    Tab(
                      child: TabWithIcon(
                        text: 'Explore',
                        imagePath: 'assets/explore_icon.png',
                        isSelected: true,
                      ),
                    ),
                    Tab(
                      child: TabWithIcon(
                        text: 'Trending',
                        imagePath: 'assets/trending_icon.png',
                        isSelected: false,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [AllCategories(), AllCategories()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TabWithIcon extends StatelessWidget {
  final String text;
  final String imagePath;
  final bool isSelected;

  const TabWithIcon({
    Key? key,
    required this.text,
    required this.imagePath,
    required this.isSelected,
  }) : super(key: key);

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
          Image.asset(
            imagePath,
            height: 24,
            width: 24,
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
