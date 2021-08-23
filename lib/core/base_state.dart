import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_example/app/entities/failure.dart';
part 'base_state.freezed.dart';

@freezed

///
class BaseState<T> with _$BaseState<T> {
  /// Auth initial state
  const factory BaseState.initial() = BaseInitial<T>;

  /// Auth loading state
  const factory BaseState.loading() = BaseLoading<T>;

  /// Auth error state
  const factory BaseState.error(Failure failure) = BaseError<T>;

  /// Auth success state
  const factory BaseState.success({T? data}) = BaseSuccess<T>;
}
