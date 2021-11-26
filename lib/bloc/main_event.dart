part of 'main_bloc.dart';

// events
@immutable
abstract class MainEvent {}

// this displays error message
class ShowError extends MainEvent {}

// to show splash screen
class SplashIn extends MainEvent {
  SplashIn();
}

// This will be used for showing welcome screen
class WelcomeIn extends MainEvent {
  WelcomeIn();
}
