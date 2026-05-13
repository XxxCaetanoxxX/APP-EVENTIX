import 'package:eventix/src/core/domain/usecases/usecase.dart';
import 'package:eventix/src/core/domain/entities/event.entity.dart';
import 'package:eventix/src/features/home/domain/repositories/home.repository.dart';

//TODO implementar Params
class BuscarEventosUseCase implements UseCase<List<EventEntity>, BuscarEventosUseCaseParams> {
  final HomeRepository _homeRepository;

  BuscarEventosUseCase({required HomeRepository homeRepository})
    : _homeRepository = homeRepository;

  @override
  Future<List<EventEntity>> call({BuscarEventosUseCaseParams? params}) async {
    return await _homeRepository.getEventos();
  }
}

class BuscarEventosUseCaseParams {}
