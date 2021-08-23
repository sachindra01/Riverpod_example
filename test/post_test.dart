import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_example/app/application/models.dart';

import 'package:riverpod_example/repository/repository.dart';
import 'package:riverpod_example/usecase/usecase.dart';

import 'post_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([IPostRepository])
void main() {
  late GetPostData usecase;

  late MockIPostRepository mockIPostRepository;
  setUp(() {
    mockIPostRepository = MockIPostRepository();

    usecase = GetPostData(mockIPostRepository);
  });

  final testData =
      Post(body: 'somethings return', id: 1, userId: 1, title: 'hamro desh');

  test(
    'Should get the post data from repository',
    () async {
      //arrange
      when(mockIPostRepository.getPostData())
          .thenAnswer((_) async => Left(testData));

      //act
      final result = await usecase.getPostData();

      //assert
      expect(result, Left(testData));
      verify(mockIPostRepository.getPostData());
      verifyNoMoreInteractions(mockIPostRepository);
    },
  );
}
