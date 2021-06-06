import 'package:get/get.dart';
import 'package:indomic/data/models/detail_model.dart';
import 'package:indomic/ui/utils/utils.dart';

class DetailApi extends GetConnect {
  Future<DetailModel> getDetail(String endPoint) async {
    var response = await get(BASE_URL + 'manga/detail/' + endPoint);
    if (response.status.hasError) {
      throw Error();
    }
    var list = DetailModel.fromJson(response.body);
    return list;
  }
}
