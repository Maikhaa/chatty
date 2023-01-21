import 'package:chatty/data/response/failure.dart';
import 'package:dartz/dartz.dart';

typedef ApiResponse<R> = Either<Failure, R>;
