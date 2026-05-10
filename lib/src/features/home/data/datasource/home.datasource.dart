import 'package:dio/dio.dart';
import 'package:eventix/src/config/client/eventix.client.dart';
import 'package:eventix/src/core/data/models/event.model.dart';

abstract class HomeDataSource {
  Future<List<EventModel>> getEventos();
}

class HomeDataSourceImpl implements HomeDataSource {
  final EventixClient _client;

  HomeDataSourceImpl({required client}) : _client = client;

  @override
  Future<List<EventModel>> getEventos() async {
    try {
      Response response = await _client.get('/events');
      final events = response.data as List<dynamic>;

      return events
          .map((e) => EventModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      if (e.response != null) {
        final data = e.response?.data;
        if (data is Map) {
          final msg = data['message'];
          final message = msg is List ? msg.join(', ') : msg?.toString();
          throw Exception('Erro do Servidor: ${message ?? 'Erro inesperado'}');
        }
        throw Exception(
          'Erro do Servidor: ${data?.toString() ?? 'Erro desconhecido'}',
        );
      } else {
        throw Exception('Erro de Conexão: ${e.message}');
      }
    } catch (e) {
      throw Exception('Erro interno do app ao processar eventos: $e');
    }
  }
}
