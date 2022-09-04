part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class LoadMemes extends HomeEvent {
  final List<Meme> memes;
  LoadMemes(this.memes);
}