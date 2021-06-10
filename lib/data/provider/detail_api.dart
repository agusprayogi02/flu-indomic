import 'package:get/get.dart';
import 'package:indomic/data/models/detail_model.dart';
import 'package:indomic/ui/utils/utils.dart';

class DetailApi extends GetConnect {
  Future<DetailModel> getDetail(String endPoint) async {
    var index = 3, title = "";
    Response response;
    // menggulang jika title isinya kosong
    do {
      response = await get(BASE_URL + 'manga/detail/' + endPoint);
      // print("Detail Ulang : $index");
      if (response.status.hasError) {
        print(response.status.code);
        throw Error();
      }
      title = response.body["title"];
      index--;
    } while (index >= 1 && title == "");
    var list = DetailModel.fromJson(response.body);
    return list;
  }
}
