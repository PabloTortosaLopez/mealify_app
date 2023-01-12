// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meals_and_drinks_api_client/meals_and_drinks_api_client.dart';

part 'drinks.g.dart';

@JsonSerializable()
class Drinks extends Equatable {
  const Drinks(this.drinks);

  factory Drinks.fromJson(Map<String, dynamic> json) => _$DrinksFromJson(json);

  final List<Drink> drinks;

  @override
  List<Object?> get props => [drinks];
}
