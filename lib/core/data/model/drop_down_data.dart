import 'package:equatable/equatable.dart';

class DropDownData extends Equatable {
  final String? name;
  final int? id;

  const DropDownData({
    this.name,
    this.id,
  });

  @override
  List<Object?> get props => [name, id];
}
