import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:flutter_bloc_solid_clean_code/models/meme.dart';
import 'package:flutter_bloc_solid_clean_code/repository/memes_provider.dart';
import 'package:flutter_bloc_solid_clean_code/repository/memes_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeLoadingState()) {
    on<LoadMemes>((event, emit) async {
      emit(const HomeLoadingState());
      await Future.delayed(const Duration(seconds: 2), () {});
      //final provider = LocalMemeService();
      final provider = ApiMemeService();
      final memesRepository = MemesRepository(provider);
      final memes = await memesRepository.getMemes();
      (memes.isEmpty)
          ? emit(const HomeErrorState())
          : emit(HomeLoadMemesState(memes));
    });
  }
}
