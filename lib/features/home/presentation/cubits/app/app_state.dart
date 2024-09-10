// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class AppState extends Equatable {
  final bool isEnglish;
  const AppState._({
    required this.isEnglish,
  });

  factory AppState({
    bool? isEnglish,
  }) {
    return AppState._(
      isEnglish: isEnglish ?? false,
    );
  }


  AppState copyWith({
    bool? isEnglish,
  }) {
    return AppState(
      isEnglish: isEnglish ?? this.isEnglish,
    );
  }


  @override
  List<Object> get props => [isEnglish];
}
