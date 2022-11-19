import 'dart:async';
import 'package:dio/dio.dart';
import 'package:learn_clean_arch/core/constants/strings.dart';
import 'package:learn_clean_arch/core/errors/exception.dart';
import 'package:learn_clean_arch/core/network/network_interface.dart';

class DioHelper implements INetwork {
  final Dio _dio = Dio();
  @override
  Future get(String endPoint) async {
    try {
      final response = await _dio.get(Strings.baseUrl + endPoint);
      return response.data;
    } on DioError catch (e) {
      handleDioErrors(e);
    }
  }

  handleDioErrors(DioError e) {
    if (e.type == DioErrorType.connectTimeout) {
      throw AppTimeoutException(e.message);
    }
    throw ServerException(
      endPointUrl: e.message,
      error: e.response?.data,
      message: e.message,
      statusCode: e.response!.statusCode!,
    );
  }
}
