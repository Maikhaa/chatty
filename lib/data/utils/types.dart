import 'package:chatty/data/utils/failure.dart';
import 'package:dartz/dartz.dart';

typedef ApiResponse<R> = Either<Failure, R>;
