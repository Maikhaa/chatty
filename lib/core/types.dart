import 'package:chatty/data/response/failure.dart';
import 'package:dartz/dartz.dart';

typedef ApiResponse<Response> = Either<Failure, Response>;