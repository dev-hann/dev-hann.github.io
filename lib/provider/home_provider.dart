import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_provider.g.dart';

enum DevTabType {
  profile,
  repositoy,
}

@riverpod
class Home extends _$Home {
  @override
  DevTabType build() {
    return state;
  }

  void updateDevTabType(DevTabType value) {
    state = value;
  }
}
