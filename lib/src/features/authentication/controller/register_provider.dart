import 'package:flutter/material.dart';
import 'package:noviindus_live_task_/src/features/show_video/view/screen_home.dart';
import 'package:noviindus_live_task_/src/resources/repository/register_repo.dart';
import 'package:noviindus_live_task_/src/util/snack_bar/snack_bar.dart';

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
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => ScreenHome()));
      }
      isLoading = false;
      notifyListeners();
      CustomSnackBar.showSnackBar(context, 'somthing went to wrong');
    });
  }
}
