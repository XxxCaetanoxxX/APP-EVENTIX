import 'package:eventix/src/core/domain/entities/event.entity.dart';

abstract class HomeRepository {
  Future<List<EventEntity>> getEventos();
}
