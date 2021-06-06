import 'package:indomic/data/models/detail_model.dart';
import 'package:indomic/data/provider/detail_api.dart';

class DetailRepository {
  final DetailApi api;

  DetailRepository({required this.api});

  Future<DetailModel> getAll({required String endPoint}) async {
    return await api.getDetail(endPoint);
  }
}
