import '../../domain/entities/card.dart';
import '../datasources/base_datasource.dart';
import 'base_repository.dart';

class CardsRepository extends BaseRepository<CardEntity> {
  CardsRepository(BaseDataSource<CardEntity> datasource)
      : super(datasource);
}