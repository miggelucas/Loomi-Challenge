import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loomi_challenge/src/features/tips/domain/usecase/fetch_tip_cards.dart';
import 'package:loomi_challenge/src/features/tips/presentation/model/tip_card_model.dart';

part 'tip_event.dart';
part 'tip_state.dart';

class TipBloc extends Bloc<TipEvent, TipState> {
  final FetchTipsCards fetchTipsCards;

  TipBloc({required this.fetchTipsCards}) : super(TipLoading()) {
    on<FetchTipsEvent>(_onFetchTipCards);
  }

  Future<void> _onFetchTipCards(
      FetchTipsEvent event, Emitter<TipState> emit) async {
    emit(TipLoading());

    final result = await fetchTipsCards();

    result.fold(
      (failure) => emit(TipError()),
      (tips) => emit(TipContent(tips)),
    );
  }
}
