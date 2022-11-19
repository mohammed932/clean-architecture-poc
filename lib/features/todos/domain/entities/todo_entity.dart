import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable {
  final int id;
  final String title;
  const TodoEntity({required this.id, required this.title});

  @override
  List<Object?> get props => [id, title];
}
