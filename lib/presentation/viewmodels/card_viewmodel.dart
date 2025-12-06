import '../../domain/entities/card.dart';
import '../../domain/usecases/get_cards_data_usecase.dart';
import 'base_viewmodel.dart';

class CardViewModel extends BaseViewModel<CardEntity> {
  CardViewModel(GetCardsDataUseCase<CardEntity> useCase) : super(useCase);
}
