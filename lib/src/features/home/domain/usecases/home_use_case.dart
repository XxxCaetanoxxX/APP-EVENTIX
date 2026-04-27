import 'package:eventix/src/core/domain/usecases/usecase.dart';
import 'package:eventix/src/features/home/domain/entities/event.entity.dart';
import 'package:eventix/src/features/home/domain/repositories/home_repository.dart';

//implementar Params
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
