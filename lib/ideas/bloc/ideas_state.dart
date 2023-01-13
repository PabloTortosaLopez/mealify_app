part of 'ideas_bloc.dart';

@immutable
abstract class IdeasState extends Equatable {
  const IdeasState();
}

class IdeasLoading extends IdeasState {
  @override
  List<Object?> get props => [];
}

class IdeasFailure extends IdeasState {
  @override
  List<Object?> get props => [];
}

class IdeasSuccess extends IdeasState {
  const IdeasSuccess({
    required this.pairing,
  });

  factory IdeasSuccess.newPairing(Pairing pairing) =>
      IdeasSuccess(pairing: pairing);

  final Pairing pairing;

  IdeasSuccess copyWith({
    Pairing? pairing,
  }) =>
      IdeasSuccess(
        pairing: pairing ?? this.pairing,
      );

  @override
  List<Object?> get props => [pairing];
}
