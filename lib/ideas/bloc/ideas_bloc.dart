import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ideas_event.dart';
part 'ideas_state.dart';

class IdeasBloc extends Bloc<IdeasEvent, IdeasState> {
  IdeasBloc() : super(IdeasInitial()) {
    on<IdeasEvent>((event, emit) {});
  }
}
