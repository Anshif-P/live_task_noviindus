import 'package:flutter/material.dart';
import 'package:noviindus_live_task_/src/features/show_video/model/category_model.dart';
import 'package:noviindus_live_task_/src/features/show_video/model/feed_model.dart';
import 'package:noviindus_live_task_/src/resources/local/shared_pref_model.dart';
import 'package:noviindus_live_task_/src/resources/repository/get_home_details_repo.dart';
import 'package:noviindus_live_task_/src/util/snack_bar/snack_bar.dart';

class HomeProvider extends ChangeNotifier {
  bool isLoaind = false;
  List<CategoryModel> categoryList = [];
  List<FeedModel> feedList = [];

  void getCategories(BuildContext context) async {
    isLoaind = true;
    notifyListeners();
    final String token = SharedPrefModel.instance.getData('token');
    final data = await HomeRepo().getHomeCategories(token);
    data.fold((error) {
      isLoaind = false;
      notifyListeners();
      CustomSnackBar.showSnackBar(context, error.message);
    }, (response) {
      List tempData = response['categories'];
      categoryList =
          tempData.map((value) => CategoryModel.fromJson(value)).toList();
      isLoaind = false;
      notifyListeners();
    });
  }

  void getFeed(BuildContext context) async {
    isLoaind = true;
    notifyListeners();
    final data = await HomeRepo().getFeed();
    data.fold((error) {
      isLoaind = false;
      notifyListeners();
      CustomSnackBar.showSnackBar(context, error.message);
    }, (response) {
      final List tempDataFeed = response['results'];
      feedList =
          tempDataFeed.map((value) => FeedModel.fromJson(value)).toList();
      isLoaind = false;
      notifyListeners();
    });
  }
}
