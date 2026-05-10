import 'package:eventix/src/core/domain/usecases/usecase.dart';
import 'package:eventix/src/core/domain/entities/event.entity.dart';
import 'package:eventix/src/features/home/domain/repositories/home.repository.dart';

//TODO implementar Params
class HomeUseCase implements UseCase<List<EventEntity>, HomeUseCaseParams> {
  final HomeRepository _homeRepository;

  HomeUseCase({required HomeRepository homeRepository})
    : _homeRepository = homeRepository;

  @override
  Future<List<EventEntity>> call({HomeUseCaseParams? params}) async {
    return await _homeRepository.getEventos();
  }
}

class HomeUseCaseParams {}
