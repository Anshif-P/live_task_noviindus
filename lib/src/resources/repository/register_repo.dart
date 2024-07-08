import 'package:noviindus_live_task_/src/resources/remote/api_services.dart';
import 'package:noviindus_live_task_/src/util/app_url/app_url.dart';
import 'package:noviindus_live_task_/src/util/typedef/type_def.dart';

class RegisterRepo {
  EitherResponse registerUser(Map<String, dynamic> map) async =>
      ApiService.postApi(Urls().baseUrl + Urls().registerUrl, map);
}
