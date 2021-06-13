import 'package:indomic/data/services/api_exception.dart';
import 'package:indomic/ui/utils/strings.dart';

abstract class ApiExceptionMapper {
  static String toErrorMessage(Object error) {
    if (error is ApiException) {
      if (error is ConnectionException) {
        return Strings.connectionError;
      } else if (error is EmptyResultException) {
        return Strings.emptyError;
      } else if (error is ClientErrorException) {
        return Strings.clientError;
      } else if (error is ServerErrorException) {
        return Strings.serverError;
      } else {
        return Strings.unknownError;
      }
    } else {
      return Strings.unknownError;
    }
  }
}
