// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';

class Ingredient extends Equatable {
  const Ingredient({required this.name, required this.quantity});

  final String name;
  final String quantity;

  @override
  List<Object?> get props => [name, quantity];
}
