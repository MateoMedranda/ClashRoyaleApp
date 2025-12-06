import '../entities/base_entity.dart';
import '../../data/repositories/base_repository.dart';

class GetCardsDataUseCase<T extends BaseEntity>{
  final BaseRepository<T> repository;

  GetCardsDataUseCase(this.repository);

  Future<List<T>>call() async{
    return await repository.getAllCards();
  }
}