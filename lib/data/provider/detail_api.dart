import 'package:get/get.dart';
import 'package:indomic/data/models/detail_model.dart';
import 'package:indomic/data/services/http_client.dart';

class DetailApi extends GetConnect {
  Future<DetailModel> getDetail(String endPoint) async {
    var index = 3, title = "";
    Response response;
    // menggulang jika title isinya kosong
    do {
      // print("Detail Ulang : $index");
      response = await HttpGetClient().getRequest('manga/detail/' + endPoint);

      title = response.body["title"];
      index--;
    } while (index >= 1 && title == "");
    var list = DetailModel.fromJson(response.body);
    return list;
  }
}
