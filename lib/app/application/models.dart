import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class Post with _$Post {
  const factory Post({
    int? id,
    int? userId,
    String? title,
    String? body,
  }) = _Post;
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

@freezed
class Album with _$Album {
  const factory Album({
    int? id,
    int? userId,
    String? title,
  }) = _Album;
  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
}
