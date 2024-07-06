import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:starwars/layers/domain/entity/film.dart';

part 'film_details_event.dart';

part 'film_details_state.dart';

class FilmDetailsBloc extends Bloc<FilmDetailsEvent, FilmDetailsState> {
  FilmDetailsBloc({required Film film}) : super(FilmDetailsState(film: film));
}
