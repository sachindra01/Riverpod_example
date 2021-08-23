import 'package:dartz/dartz.dart';
import 'package:riverpod_example/app/application/models.dart';
import 'package:riverpod_example/app/entities/failure.dart';
import 'package:riverpod_example/repository/repository.dart';

class GetPostData {
  final IPostRepository repository;
  GetPostData(this.repository);
  Future<Either<Post, Failure>> getPostData() async {
    return await repository.getPostData();
  }
}
