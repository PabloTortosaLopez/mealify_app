part of 'ideas_bloc.dart';

@immutable
abstract class IdeasEvent extends Equatable {
  const IdeasEvent();
  @override
  List<Object?> get props => [];
}

class IdeasLoaded extends IdeasEvent {}

class ShowMeMorePressed extends IdeasEvent {}
