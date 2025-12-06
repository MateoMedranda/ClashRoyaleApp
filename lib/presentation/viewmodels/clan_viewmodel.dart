import '../../domain/entities/clan.dart';
import '../../domain/usecases/get_cards_data_usecase.dart';
import 'base_viewmodel.dart';

class ClanViewModel extends BaseViewModel<ClanEntity> {
  ClanViewModel(GetCardsDataUseCase<ClanEntity> useCase) : super(useCase);
}
