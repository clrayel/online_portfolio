part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loaded({
    required ShortDescription about,
    required List<ShortDescription> works,
    required List<ShortDescription> education,
    required List<String> trivia,
    required List<SkillIcon> skills,
    required AssetImage phone,
    required AssetImage mail,
    required AssetImage linkedin,
  }) = _Loaded;
}
