import 'package:eventix/src/features/home/domain/entities/event.entity.dart';

abstract class HomeRepository {
  Future<List<EventEntity>> getEventos();
}
