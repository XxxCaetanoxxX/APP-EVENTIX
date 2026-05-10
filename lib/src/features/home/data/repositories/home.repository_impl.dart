import 'package:eventix/src/features/home/data/datasource/home.datasource.dart';
import 'package:eventix/src/core/domain/entities/event.entity.dart';
import 'package:eventix/src/features/home/domain/repositories/home.repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource _dataSource;

  HomeRepositoryImpl({required HomeDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<List<EventEntity>> getEventos() async {
    return await _dataSource.getEventos();
  }
}
