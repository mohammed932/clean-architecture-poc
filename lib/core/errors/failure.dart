import 'package:equatable/equatable.dart';
import 'package:learn_clean_arch/core/errors/exception.dart';

class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class OfflineFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  final ServerException serverException;
  ServerFailure({required this.serverException});
  @override
  List<Object?> get props => [serverException];
}

class EmptyCacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}
