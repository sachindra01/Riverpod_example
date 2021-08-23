import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_example/core/base_state.dart';

import 'package:riverpod_example/repository/repository.dart';

final albumController = StateNotifierProvider.autoDispose((ref) {
  ref.onDispose(() {});
  return AlbumController(ref.read)..getAlbumData();
});

class AlbumController<T> extends StateNotifier<BaseState> {
  AlbumController(
    this._read,
  ) : super(const BaseState.initial());

  final Reader _read;

  ///

  IAlbumRepository get _albumRepo => _read(albumRepository);

  Future<void> getAlbumData() async {
    state = const BaseState.loading();
    final response = await _albumRepo.getAlbumData();
    state = response.fold(
      (user) => BaseState.success(data: user),
      (failure) => BaseState.error(failure),
    );
  }
}
