import 'package:get/get.dart';
import 'package:indomic/data/models/detail_model.dart';
import 'package:indomic/ui/utils/utils.dart';

class DetailApi extends GetConnect {
  Future<DetailModel> getDetail(String endPoint) async {
    var response = await get(BASE_URL + 'manga/detail/' + endPoint);
    if (response.status.hasError) {
      print(response.status.code);
      throw Error();
    }
    print("Tidak error: " + response.status.code.toString());
    if (response.body['title'] == "") {
      response = await get(BASE_URL + 'manga/detail/' + endPoint);
    }
    var list = DetailModel.fromJson(response.body);
    return list;
  }
}
