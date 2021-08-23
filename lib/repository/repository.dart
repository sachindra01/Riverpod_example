import 'dart:developer';

import 'package:dartz/dartz.dart';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_example/app/entities/failure.dart';
import 'package:riverpod_example/app_setup/dio/dio_client.dart';
import 'package:riverpod_example/core/app_endpoint.dart';
import 'package:riverpod_example/app/application/models.dart';

final postRepository = Provider<IPostRepository>((ref) {
  return PostRepository(ref.read);
});
final albumRepository = Provider<IAlbumRepository>((ref) {
  return AlbumRepository(ref.read);
});

abstract class IPostRepository {
  Future<Either<Post, Failure>> getPostData({CancelToken? cancelToken});
}

abstract class IAlbumRepository {
  Future<Either<List<Album>, Failure>> getAlbumData({CancelToken? cancelToken});
}

class PostRepository implements IPostRepository {
  ///
  PostRepository(Reader read) : _read = read;

  final Reader _read;

  Dio get _dio => _read(dioProvider);
  @override
  Future<Either<Post, Failure>> getPostData({CancelToken? cancelToken}) async {
    try {
      final response = await _dio.get(Ep.albums);

      final data = Post.fromJson(response.data);

      log('$data');

      return Left(data);
    } on DioError catch (e) {
      return Right(e.toFailure);
    } catch (e) {
      return Right(Failure.fromException(e));
    }
  }
}

class AlbumRepository implements IAlbumRepository {
  ///
  AlbumRepository(Reader read) : _read = read;

  final Reader _read;

  Dio get _dio => _read(dioProvider);

  @override
  Future<Either<List<Album>, Failure>> getAlbumData(
      {CancelToken? cancelToken}) async {
    try {
      final response = await _dio.get(Ep.albums);
      final result = List<Map<String, dynamic>>.from(response.data);
      final data = result.map((e) => Album.fromJson(e)).toList();

      // final data = response.data.map((e) {
      //   return Album.fromJson(e);
      // }).toList();
      log('$data');
      return Left(data);
    } on DioError catch (e) {
      return Right(e.toFailure);
    } catch (e) {
      return Right(Failure.fromException(e));
    }
  }
}
