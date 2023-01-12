// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meals_and_drinks_api_client/meals_and_drinks_api_client.dart';

part 'meals.g.dart';

@JsonSerializable()
class Meals extends Equatable {
  const Meals(this.meals);

  factory Meals.fromJson(Map<String, dynamic> json) => _$MealsFromJson(json);

  final List<Meal> meals;

  @override
  List<Object?> get props => [meals];
}
