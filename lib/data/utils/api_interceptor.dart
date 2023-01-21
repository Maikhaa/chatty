import 'package:chatty/data/utils/failure.dart';
import 'package:chatty/data/utils/types.dart';
import 'package:dartz/dartz.dart';

Future<ApiResponse<R>> apiInterceptor<R>(
  Future<R> Function() call,
) async {
  try {
    final response = await call();
    return Right(response);
  } on Exception catch (e) {
    return Left(Failure(e));
  }
}
