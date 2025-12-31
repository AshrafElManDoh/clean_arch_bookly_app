import 'package:clean_arch_bookly_app/core/errors/failure.dart';
import 'package:dio/dio.dart';

class ServerFailure extends Failure {
  final String errMsg;

  ServerFailure({required this.errMsg});

  factory ServerFailure.fromDioExceptions(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMsg: "Connection Time out ,please try again!");
      case DioExceptionType.sendTimeout:
        return ServerFailure(errMsg: "Send Time out ,please try again!");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMsg: "Receive Time out ,please try again!");
      case DioExceptionType.badCertificate:
        return ServerFailure(errMsg: "Bad certificate ,please try again!");
      case DioExceptionType.badResponse:
        // return ServerFailure(errmsg: "Bad Response");
        return ServerFailure.fromResponse(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure(errMsg: "Your request canceled");
      case DioExceptionType.connectionError:
        return ServerFailure(errMsg: "Connection error");
      case DioExceptionType.unknown:
        return ServerFailure(
          errMsg: "OOPs there was an error , please try again later!",
        );
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      if (response is Map) {
        return ServerFailure(errMsg: response["error"]["message"]);
      } else {
        // log(response.toString());
        return ServerFailure(errMsg: response.toString());
      }
    } else if (statusCode == 404) {
      return ServerFailure(errMsg: "Your request not found!");
    } else if (statusCode == 500) {
      return ServerFailure(errMsg: "Internal Server error ,please try again!");
    } else {
      return ServerFailure(
        errMsg: "OOPs there was an error , please try again later!",
      );
    }
  }
}
