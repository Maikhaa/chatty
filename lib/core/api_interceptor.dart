import 'package:chatty/core/types.dart';
import 'package:chatty/data/response/failure.dart';
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
