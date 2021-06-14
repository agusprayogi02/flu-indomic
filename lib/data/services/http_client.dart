import 'dart:io';

import 'package:get/get.dart';
import 'package:indomic/data/services/api_exception.dart';
import 'package:indomic/ui/utils/utils.dart';

class HttpGetClient extends GetConnect {
  Future<Response> getRequest(String path) async {
    Response response;
    try {
      response = await get(BASE_URL + path);
      var statusCode = response.statusCode!;
      if (statusCode >= 200 && statusCode < 299) {
        if (response.body.isEmpty) {
          throw EmptyResultException();
        } else {
          return response;
        }
      } else if (statusCode >= 400 && statusCode < 500) {
        throw ClientErrorException();
      } else if (statusCode >= 500 && statusCode < 600) {
        throw ServerErrorException();
      } else if (response.hasError) {
        throw ConnectionException();
      } else {
        throw ConnectionException();
      }
    } on SocketException {
      throw ConnectionException();
    } catch (e) {
      throw ConnectionException();
    }
  }
}
