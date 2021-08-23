import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_example/core/base_state.dart';
import 'package:riverpod_example/app/application/models.dart';
import 'package:riverpod_example/repository/repository.dart';

final postController = StateNotifierProvider.autoDispose((ref) {
  ref.onDispose(() {});
  return PostController<Post>(ref.read)..getPostData();
});

class PostController<T> extends StateNotifier<BaseState> {
  PostController(
    this._read,
  ) : super(const BaseState.initial());

  final Reader _read;

  ///

  IPostRepository get _postRepo => _read(postRepository);

  Future<void> getPostData() async {
    state = const BaseState.loading();
    final response = await _postRepo.getPostData();
    state = response.fold(
      (user) => BaseState<Post>.success(data: user),
      (failure) => BaseState.error(failure),
    );
  }
}
