import '../../domain/entities/clan.dart';
import '../datasources/base_datasource.dart';
import 'base_repository.dart';

class ClansRepository extends BaseRepository<ClanEntity> {
  ClansRepository(BaseDataSource<ClanEntity> datasource) : super(datasource);
}
