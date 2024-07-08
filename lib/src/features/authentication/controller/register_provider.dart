import 'package:flutter/material.dart';
import 'package:noviindus_live_task_/src/features/show_video/controller/get_home_datas.dart';
import 'package:noviindus_live_task_/src/features/show_video/view/screen_home.dart';
import 'package:noviindus_live_task_/src/resources/local/shared_pref_model.dart';
import 'package:noviindus_live_task_/src/resources/repository/register_repo.dart';
import 'package:noviindus_live_task_/src/util/snack_bar/snack_bar.dart';
import 'package:provider/provider.dart';

class RegisterProvider extends ChangeNotifier {
  bool isLoading = false;
  registerUser(String countryCode, String number, BuildContext context) async {
    isLoading = true;
    notifyListeners();
    final data = await RegisterRepo()
        .registerUser({"country_code": countryCode, 'phone': number});
    data.fold((error) {
      print('error response');
      print(error.message);
      isLoading = false;
      notifyListeners();
      CustomSnackBar.showSnackBar(context, error.message);
    }, (response) {
      print(response);
      if (response['status'] == true) {
        isLoading = false;
        notifyListeners();
        SharedPrefModel.instance
            .insertData('token', response['token']['access']);
        Provider.of<HomeProvider>(context, listen: false)
            .getCategories(context);
        Provider.of<HomeProvider>(context, listen: false).getFeed(context);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => ScreenHome()));
      }
      isLoading = false;
      notifyListeners();
      CustomSnackBar.showSnackBar(context, 'somthing went to wrong');
    });
  }
}
