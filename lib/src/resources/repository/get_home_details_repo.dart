import 'package:noviindus_live_task_/src/resources/remote/api_services.dart';
import 'package:noviindus_live_task_/src/util/app_url/app_url.dart';
import 'package:noviindus_live_task_/src/util/typedef/type_def.dart';

class HomeRepo {
  EitherResponse getHomeCategories(String token) async =>
      ApiService.getApi(Urls().baseUrl + Urls().getCategory, token);

  EitherResponse getFeed() async => ApiService.getApi(
        Urls().baseUrl + Urls().getHomeData,
      );
}
