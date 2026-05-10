import 'package:dio/dio.dart';

extension DioExceptionX on DioException {
  String get errorMessage {
    if (response?.statusCode == 401) {
      return 'Sessão expirada, faça login novamente';
    } else if (response?.statusCode == 404) {
      return 'Recurso não encontrado';
    } else if (response?.statusCode == 500) {
      return 'Erro interno no servidor';
    }

    return response?.data?['message'] ?? 'Erro inesperado de conexão';
  }
}
