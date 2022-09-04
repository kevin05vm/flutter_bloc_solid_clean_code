part of 'home_bloc.dart';

@immutable
abstract class HomeState {
  const HomeState();
}

class HomeLoadingState extends HomeState {
  const HomeLoadingState() : super();
}

class HomeErrorState extends HomeState {
  const HomeErrorState() : super();
}

class HomeLoadMemesState extends HomeState {
  final List<Meme> memes;
  const HomeLoadMemesState(this.memes);
}