import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:recipes_repository/recipes_repository.dart';

part 'ideas_event.dart';
part 'ideas_state.dart';

class IdeasBloc extends Bloc<IdeasEvent, IdeasState> {
  IdeasBloc(
    this._recipesRepository,
  ) : super(IdeasLoading()) {
    on<LoadIdeas>(_onLoadIdeas);
    on<ShowMeMorePressed>(_onShowMeMorePressed);
  }

  final RecipesRepository _recipesRepository;

  Future<void> _onLoadIdeas(
    LoadIdeas event,
    Emitter<IdeasState> emit,
  ) {
    return _loadRandomPairing(emit);
  }

  Future<void> _onShowMeMorePressed(
    ShowMeMorePressed event,
    Emitter<IdeasState> emit,
  ) async {
    //if (state is IdeasSuccess) {
    //final current = state as IdeasSuccess;
    // if (current.isCocktailLocked && !current.isRecipeLocked) {
    // return _loadRandomRecipe(emit);
    //} else if (current.isRecipeLocked && !current.isCocktailLocked) {
    // return _loadRandomCocktail(emit);
    //} else if (current.isRecipeLocked && current.isCocktailLocked) {
    //  return;
    //}
    //}
    return _loadRandomPairing(emit);
  }

  Future<void> _loadRandomPairing(Emitter<IdeasState> emit) async {
    emit(IdeasLoading());
    try {
      final pairing = await _recipesRepository.getRandomPairing();
      emit(IdeasSuccess.newPairing(pairing));
    } catch (_) {
      emit(IdeasFailure());
    }
  }
}
